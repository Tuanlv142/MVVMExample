//
//  ArticleViewModel.swift
//  MVVMExample
//
//  Created by TUANLE5 on 05/01/2024.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
