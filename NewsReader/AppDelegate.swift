//
//  AppDelegate.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var instance: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        #if DEBUG
        // For detailed formatted logs of API requests
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
        #endif
        
        // Window setup
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        // Dependency Container Initialization
        let appContainer = AppContainer.build()
        let viewModelContainer = ViewModelContainer.build(parentContainer: appContainer)
        _ = ViewControllerContainer.build(parentContainer: viewModelContainer)
        
        // Onboarding
        appContainer.resolve(SceneCoordinatorType.self)?.onboardingTransition()
        
        return true
    }
}

