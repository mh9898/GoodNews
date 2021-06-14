//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by MiciH on 6/14/21.
//

import Foundation

//list of rows
struct ArticleListViewModel {
    var articles: [Article]
}



extension ArticleListViewModel{
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAt(index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}




//single row
struct ArticleViewModel {
    private let article: Article
}

//using extension as init
extension ArticleViewModel{
    init(_ article: Article) {
        self.article = article
    }
}

//using extension for prop
extension ArticleViewModel{
    var title: String{
        return self.article.title ?? ""
    }
    var description: String{
        return self.article.description ?? ""
    }
    
}
