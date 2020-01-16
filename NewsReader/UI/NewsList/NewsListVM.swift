//
//  NewsListVM.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import RxCocoa
import RxSwift

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
        let itemSelect: Driver<Int>
    }
    
    struct Output {
        let articles: Driver<[NewsListCell.Data]>
        let loading: Driver<Bool>
        let transition: Driver<Scene>
    }
    
    func transform(input: Input) -> Output {
        let articles = articleService
            .getArticles()
            .asObservable()
            .share()
            
        let articleData = articles
            .map { $0.map(NewsListCell.Data.init) }
        
        let loading: Driver<Bool> = articles
            .map { _ in false }
            .startWith(true)
            .asDriver(onErrorJustReturn: false)
        
        let transition = Observable.combineLatest(articles, input.itemSelect.asObservable())
            .map { Scene.newsDetails(article: $0[$1]) }
            .asDriver(onErrorJustReturn: .newsList)
        
        return Output(articles: articleData.asDriver(onErrorJustReturn: []),
                      loading: loading,
                      transition: transition)
    }
}
