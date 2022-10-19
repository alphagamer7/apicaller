//
//  Todo.swift
//  apicaller
//
//  Created by Athif on 2022-10-18.
//

import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
