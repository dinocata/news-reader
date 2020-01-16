//
//  AppContainer.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Swinject
import Moya

/// App-wide dependency injections.
/// Defines helper, service and repository singletons.
final class AppContainer: ContainerProtocol {
    
    static var instance: Container!
    
    static func build() -> Container {
        // Automatically defines all registered dependencies as singletons
        instance = Container(defaultObjectScope: .container)
        
        // Scene Coordinator
        instance.register(SceneCoordinatorType.self) { _ in
            SceneCoordinator(window: AppDelegate.instance.window!)
        }
        
        // Moya Provider
        instance.register(MoyaProvider<ApiEndpoint>.self) { _ in
            return MoyaProvider<ApiEndpoint>()
        }
        
        // Network
        instance.register(NetworkProtocol.self) {
            ApiNetwork(provider: $0.resolve(MoyaProvider<ApiEndpoint>.self)!)
        }
        
        // Article Service
        instance.register(ArticleService.self) {
            ArticleServiceImpl(network: $0.resolve(NetworkProtocol.self)!)
        }
        
        return instance
    }
}
