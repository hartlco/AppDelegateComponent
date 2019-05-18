//
//  AppDelegate.swift
//  AppDelegateComponent
//
//  Created by hartlco on 05/12/2019.
//  Copyright (c) 2019 hartlco. All rights reserved.
//

import UIKit
import AppDelegateComponent

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppDelegateComponentStore {
    private let componentRunner = AppDelegateComponentRunner()
    let storedComponents: [AppDelegateComponent] = [BackgroundSwitchComponent()]
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return componentRunner.componentStore(self,
                                       application: application,
                                       didFinishLaunchingWithOptions: launchOptions)
    }

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return componentRunner.componentStore(self,
                                              application: application,
                                              willFinishLaunchingWithOptions: launchOptions)
    }
}

final class BackgroundSwitchComponent: AppDelegateComponent {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            application.keyWindow?.rootViewController?.view.backgroundColor = .purple
        }
    }
}
