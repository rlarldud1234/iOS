//
//  TCA_StudyApp.swift
//  TCA-Study
//
//  Created by 김기영 on 2022/11/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_StudyApp: App {
    let counterStore = Store(
        initialState: CounterState(),
        reducer: counterReducer,
        environment: CounterEnvironment()
    )
    let memoStore = Store(
        initialState: MemoState(),
        reducer: memoReducer,
        environment: MemoEnvironment(
            memoClient: MemoClient.live,
            mainQueue: .main
        )
    )
    var body: some Scene {
        WindowGroup {
            CounterView(store: counterStore)
        }
    }
}
