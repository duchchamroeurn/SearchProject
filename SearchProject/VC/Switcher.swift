//
//  Switcher.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/31/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import UIKit

class Switcher {
    public static let share = Switcher()
    
    private init() {}
    
    public func switchScreen(to screen: ScreenType = .welcome) {
        var rootVC: UIViewController?
        
        switch screen {
            
        case .welcome:
            let welcome = UIStoryboard.init(name: screen.storyboard, bundle: nil).instantiateInitialViewController() as! WelcomeVC
            rootVC = welcome
        case .search:
            let main = UIStoryboard.init(name: screen.storyboard, bundle: nil).instantiateInitialViewController() as! UINavigationController
            rootVC = main
        case .auth:
            let auth = UIStoryboard.init(name: screen.storyboard, bundle: nil).instantiateInitialViewController() as! UINavigationController
            rootVC = auth
        }
        
        AppDelegate.share.window?.rootViewController = rootVC
    }
}
