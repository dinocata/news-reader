//
//  ArticleResponse.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
