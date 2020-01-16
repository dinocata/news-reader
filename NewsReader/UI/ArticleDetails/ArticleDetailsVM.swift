//
//  ArticleDetailsVM.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import RxCocoa

class ArticleDetailsVM {
    
}

// Binding
extension ArticleDetailsVM: ViewModelType {
    struct ViewData {
        let title: String
        let author: String
        let imagePath: String
        let description: String
        
        init(article: Article) {
            self.title = article.title
            self.author = article.author
            self.imagePath = article.urlToImage
            self.description = article.description
        }
    }
    
    struct Input {
        let article: Driver<Article>
        let source: Driver<Void>
    }
    
    struct Output {
        let data: Driver<ViewData>
        let link: Driver<URL>
    }
    
    func transform(input: Input) -> Output {
        let link = input.source
            .withLatestFrom(input.article)
            .map { URL(string: $0.url)! }
            .asDriver()
        
        return Output(data: input.article.map(ViewData.init),
                      link: link)
    }
}
