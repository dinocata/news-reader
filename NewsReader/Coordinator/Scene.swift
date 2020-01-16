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
        // TODO: implement controllers
        switch self {
        case .newsList:
            return UINavigationController(rootViewController: UIViewController())
        case .newsDetails:
            return UIViewController()
        }
    }
}
