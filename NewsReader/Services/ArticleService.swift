//
//  NewsService.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import RxSwift

protocol ArticleService {
    func getArticles() -> Single<[Article]>
}

class ArticleServiceImpl: ArticleService {
    // Dependencies
    var network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func getArticles() -> Single<[Article]> {
        let request: Single<NetworkResult<ArticleResponse>> = network.request(.news)
        return request
            .map { result -> [Article] in
                switch result {
                case .success(let data):
                    return data.articles
                case .failure:
                    return []
                }
        }
    }
}
