//
//  Screens.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/31/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import Foundation

enum ScreenType: CaseIterable {
    case welcome
    case search
    case auth
    
    var storyboard: String {
        get {
            switch self {
            case .welcome:
                return NameOfStroyboard.Welcome
            case .search:
                return NameOfStroyboard.Main
            case .auth:
                return NameOfStroyboard.Auth
            }
        }
    }
    var name: String {
        get {
            switch self {
            case .welcome: return "Welcome"
            case .search: return "DCR Search"
            case .auth: return "DCR Authentication"
            }
        }
    }
}
