//
//  Memo.swift
//  TCA-Study
//
//  Created by 김기영 on 2022/11/23.
//

import Foundation

struct Memo: Codable, Identifiable, Equatable {
    let createAt, title, viewCount, id: String
}

typealias Memos = [Memo]
