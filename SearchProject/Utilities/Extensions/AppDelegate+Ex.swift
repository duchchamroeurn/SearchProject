//
//  AppDelegate+Ex.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/31/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import UIKit

extension AppDelegate {
    public static var share: AppDelegate {
        get { return UIApplication.shared.delegate as! AppDelegate }
    }
}
