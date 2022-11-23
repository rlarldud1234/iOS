//
//  ContentView.swift
//  TCA-Study
//
//  Created by 김기영 on 2022/11/23.
//

import SwiftUI

import ComposableArchitecture

// Domain + State
struct CounterState: Equatable {
    var count = 0
}

// Domain + Action
enum CounterAction: Equatable {
    case addCount // 카운트를 더하는 액션
    case subtractCount // 카운트를 빼는 액션
}

struct CounterEnvironment { }

let counterReducer = AnyReducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
    // 들어온 액션에 따라 상태를 변경
    switch action {
    case .addCount:
        state.count += 1
        return Effect.none
    case .subtractCount:
        state.count -= 1
        return Effect.none
    }
}

struct CounterView: View {
    let store: Store<CounterState, CounterAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text("count: \(viewStore.state.count)")
                    .padding()
                HStack {
                    Button("더하기") {
                        viewStore.send(.addCount)
                    }
                    Button("빼기") {
                        viewStore.send(.subtractCount)
                    }
                }
            }
        }
    }
}
