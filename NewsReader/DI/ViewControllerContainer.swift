//
//  ViewControllerContainer.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Swinject

/// View Controller dependency injections
class ViewControllerContainer: ChildContainerProtocol {
    
    static var instance: Container!
    
    static func build(parentContainer: Container) -> Container {
        instance = Container(parent: parentContainer)
        
        // TODO
        
        return instance
    }
}
