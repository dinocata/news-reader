//
//  SceneCoordinator.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit

protocol SceneCoordinatorType {
    /// Current visible view controller.
    var currentViewController: UIViewController! { get set }
    
    /// Navigates to a Scene using specified transition type.
    ///
    /// - Parameters:
    ///   - scene: Scene to navigate to
    ///   - type: Transition type
    func transition(to scene: Scene, type: SceneTransition, completion: (() -> Void)?)
    
    /// Dismisses (or pops) current view controller.
    ///
    /// - Parameter animated: Animated transition
    func pop(animated: Bool, completion: (() -> Void)?)
    
    /// Call in order to navigate based on current App state.
    func onboardingTransition()
}

class SceneCoordinator: SceneCoordinatorType {
    var currentViewController: UIViewController!
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func transition(to scene: Scene, type: SceneTransition, completion: (() -> Void)?) {
        let viewController = scene.viewController
        
        switch type {
        case .root:
            window.rootViewController = viewController
            completion?()
            
        case .push:
            guard let navigationController = currentViewController.navigationController else {
                fatalError("Can't push a view controller without a current navigation controller")
            }
            navigationController.pushViewController(viewController, animated: true)
            completion?()
            
        case .present:
            currentViewController.present(viewController,
                                          animated: true,
                                          completion: completion)
        }
        currentViewController = viewController
    }
    
    func pop(animated: Bool, completion: (() -> Void)?) {
        if let navigationController = currentViewController.navigationController,
            navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: true)
            self.currentViewController = navigationController.viewControllers.last!
            completion?()
            
        } else if let presenter = currentViewController.presentingViewController {
            currentViewController.dismiss(animated: animated, completion: completion)
            self.currentViewController = presenter
            
        } else {
            fatalError("Not a modal, no navigation controller: can't navigate back from \(currentViewController!)")
        }
    }
    
    func onboardingTransition() {
        transition(to: .newsList, type: .root, completion: nil)
    }
}
