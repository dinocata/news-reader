//
//  ContainerProtocol.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Swinject

protocol ContainerProtocol {
    static var instance: Container! { get }
    
    static func build() -> Container
}

protocol ChildContainerProtocol {
    static var instance: Container! { get }
    
    static func build(parentContainer: Container) -> Container
}
