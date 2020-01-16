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
        
        registerVC(NewsListVC.self)
        
        return instance
    }
    
    /// Registers a Controller to this container.
    /// Use this wrapper method if the controller does not take any extra arguments (reduces boiler plate).
    ///
    /// - Parameter type: Controller type
    private static func registerVC<H: ViewModelType, T: MVVMController<H>>(_ type: T.Type) {
        instance.register(type) {
            T.init(viewModel: $0.resolve(H.self)!,
                   coordinator: $0.resolve(SceneCoordinatorType.self)!)
        }
    }
}
