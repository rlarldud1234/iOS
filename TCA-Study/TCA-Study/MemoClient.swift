//
//  MemoClient.swift
//  TCA-Study
//
//  Created by 김기영 on 2022/11/23.
//

import Foundation

import ComposableArchitecture

struct MemoClient {
    var fetchMemoItem: (_ id: String) -> Effect<Memo, Failure>

    var fetchMemos: () -> Effect<Memos, Failure>

    struct Failure: Error, Equatable { }
}

extension MemoClient {
    static let live = Self(
        fetchMemoItem: { id in
            Effect.task {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "\(id)")!)
                return try JSONDecoder().decode(Memo.self, from: data)
            }
            .mapError { _ in Failure() }
            .eraseToEffect()
        },
        fetchMemos: {
            Effect.task {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "")!)
                return try JSONDecoder().decode(Memos.self, from: data)
            }
            .mapError { _ in Failure() }
            .eraseToEffect()
        }
    )
}
