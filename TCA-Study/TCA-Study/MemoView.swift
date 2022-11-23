//
//  ContentView.swift
//  TCA-Study
//
//  Created by 김기영 on 2022/11/23.
//

import Foundation
import SwiftUI
import ComposableArchitecture

// Domain + State
struct MemoState: Equatable {
    var memos: [Memo] = []
    var selectedMemo: Memo? = nil
    var isLoading: Bool = false
}

// Domain + Action
enum MemoAction: Equatable {
    case fetchItem(_ id: String)
    case fetchItemResponse(Result<Memo, MemoClient.Failure>)
    case fetchAll
    case fetchAllResponse(Result<[Memo], MemoClient.Failure>)
}

// 환경설정 주입
struct MemoEnvironment {
    var memoClient: MemoClient
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

let memoReducer = AnyReducer<MemoState, MemoAction, MemoEnvironment> { state, action, environment in
    // 들어온 액션에 따라 상태를 변경
    switch action {
    case .fetchItem(let id):
        enum FetchItemId {}
        state.isLoading = true
        return environment.memoClient.fetchMemoItem(id)
            .debounce(id: FetchItemId.self, for: 0.3, scheduler: environment.mainQueue)
            .catchToEffect(MemoAction.fetchItemResponse)
    case .fetchItemResponse(.success(let memo)):
        state.selectedMemo = memo
        state.isLoading = false
        return Effect.none
    case .fetchItemResponse(.failure):
        state.selectedMemo = nil
        state.isLoading = false
        return Effect.none
    case .fetchAll:
        enum FetchAllId {}
        state.isLoading = true
        return environment.memoClient.fetchMemos()
            .debounce(id: FetchAllId.self, for: 0.3, scheduler: environment.mainQueue)
            .catchToEffect(MemoAction.fetchAllResponse)
    case .fetchAllResponse(.success(let memos)):
        state.memos = memos
        state.isLoading = false
        return Effect.none
    case .fetchAllResponse(.failure):
        state.memos = []
        state.isLoading = false
        return Effect.none
    }
}

struct MemoView: View {
    let store: Store<MemoState, MemoAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            List(viewStore.state.memos, id: \.id) { memo in
                Text(memo.title)
                    .onTapGesture {
                        viewStore.send(.fetchItem(memo.id))
                    }
            }
            .onAppear { viewStore.send(.fetchAll) }
        }
    }
}
