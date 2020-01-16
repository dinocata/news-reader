//
//  ApiEndpoint.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Moya

enum ApiEndpoint {
    case news
}

extension ApiEndpoint: TargetType {
    var baseURL: URL {
        return URL(string: Constants.Api.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .news:
            return "everything"
        }
    }
    
    var method: Method {
        switch self {
        case .news:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .news:
            return .requestParameters(parameters: Constants.Api.baseParameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .news:
            return Constants.Api.baseHeaders
        }
    }
    
    // We dont have tests, so this is not needed
    var sampleData: Data {
        return Data(base64Encoded: "nothing")!
    }
}
