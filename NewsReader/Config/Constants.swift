//
//  Constants.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Foundation

final class Constants {
    class Api {
        static let apiKey = "6813aa850bf443ccbddf25eac2fea975"
        static let baseUrl = "https://newsapi.org/v2/"
        
        static var baseParameters:  [String: Any] {
            return [
                "q": "bitcoin",
                "apiKey": apiKey
            ]
        }
        
        static let baseHeaders = [
            "Content-Type": "application/json"
        ]
    }
}
