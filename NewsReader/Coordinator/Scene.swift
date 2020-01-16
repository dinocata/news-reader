//
//  Scene.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit

enum Scene {
    case newsList
    case newsDetails
}

extension Scene {
    var viewController: UIViewController {
        let container = ViewControllerContainer.instance!
        switch self {
        case .newsList:
            return UINavigationController(rootViewController: container.resolve(NewsListVC.self)!)
        case .newsDetails:
            return UIViewController()
        }
    }
    
    var defaultTransitionType: SceneTransition {
        switch self {
        case .newsList:
            return .root
        case .newsDetails:
            return .push
        }
    }
}
