//
//  Article.swift
//  MVVMExample
//
//  Created by TUANLE5 on 05/01/2024.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
