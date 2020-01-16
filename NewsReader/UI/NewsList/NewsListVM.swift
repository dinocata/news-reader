//
//  NewsListVM.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import RxCocoa

class NewsListVM {
    // Dependencies
    let articleService: ArticleService
    
    init(articleService: ArticleService) {
        self.articleService = articleService
    }
}

// Binding
extension NewsListVM: ViewModelType {
    struct Input {
        
    }
    
    struct Output {
        let articles: Driver<[Article]>
        let loading: Driver<Bool>
    }
    
    func transform(input: Input) -> Output {
        let articles = articleService
            .getArticles()
            .asDriver(onErrorJustReturn: [])
        
        return Output(articles: articles,
                      loading: .just(false))
    }
}
