//
//  Article.swift
//  GoodNews
//
//  Created by MiciH on 6/13/21.
//

import Foundation

struct ListArticles: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
