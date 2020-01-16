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
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
