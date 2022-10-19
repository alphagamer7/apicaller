//
//  News.swift
//  apicaller
//
//  Created by test on 2022-10-18.
//

import Foundation

struct NewsResult: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

struct Article: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable {
    var id : String?
    var name: String?
}
