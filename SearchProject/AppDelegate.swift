//
//  AppDelegate.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/28/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Switcher.share.switchScreen()
        return true
    }


}

