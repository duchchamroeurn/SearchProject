//
//  NameOfWS.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/28/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import Foundation

struct NameOfWS {
    public static var BASE_URL: String {
        get {
            switch WSManager.shareInstance.env {
            case .dev:
                return "http://127.0.0.1:8000"
            case .pro:
                return ""
            }
        }
    }
}
