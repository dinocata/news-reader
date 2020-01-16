//
//  ViewModelContainer.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Swinject

/// View Model dependency injections
class ViewModelContainer: ChildContainerProtocol {
    
    static var instance: Container!
    
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer, defaultObjectScope: .transient)
        
        instance.register(NewsListVM.self) {
            NewsListVM(articleService: $0.resolve(ArticleService.self)!)
        }
        
        return instance
    }
}
