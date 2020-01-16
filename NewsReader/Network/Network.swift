//
//  Network.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Moya
import RxSwift

typealias NetworkResult<T> = Result<T, NetworkError>

/// Wrapper that handles response errors
struct NetworkError: Error {
    let statusCode: Int
    var errorMessage: String
    
    init(error: MoyaError?) {
        self.statusCode = error?.response?.statusCode ?? -1
        self.errorMessage = error?.errorDescription ?? "unknown error"
        
        #if DEBUG
        if let error = error {
            print(error.localizedDescription)
            print(error)
        }
        #endif
    }
}

/// Wrapper for Moya requests, which wraps the responses in a NetworkResult observable.
protocol NetworkProtocol {
    
    /// Performs API request.
    ///
    /// - Parameters:
    ///   - target: Target API endpoint
    ///   - responseType: Type of data to parse the response to
    /// - Returns: Response result wrapped in a observable
    func request<T: Decodable>(_ target: ApiEndpoint) -> Single<NetworkResult<T>>
}

class Network<ApiTarget: TargetType> {
    private let provider: MoyaProvider<ApiEndpoint>
    
    init(provider: MoyaProvider<ApiEndpoint>) {
        self.provider = provider
    }
    
    func request<T: Decodable>(_ target: ApiEndpoint) -> Single<NetworkResult<T>> {
        return provider.rx.request(target)
            .filterSuccessfulStatusCodes()
            .map(T.self)
            .map { NetworkResult<T>.success($0) }
            .catchError { Single.just(.failure(NetworkError(error: $0 as? MoyaError))) }
    }
}

class ApiNetwork: Network<ApiEndpoint>, NetworkProtocol {}
