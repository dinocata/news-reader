//
//  UIViewControllerExt.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit

extension UIViewController {
    func actualViewController() -> UIViewController {
        if let navigationController = self as? UINavigationController {
            return navigationController.viewControllers.first!
        } else {
            return self
        }
    }
}
