//
//  ProgramingDetailVC.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/30/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import UIKit

class ProgramingDetailVC: UIViewController {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    public var programming: Programming!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = programming.title
        
        if let logo = self.programming.logo {
            ImageLoader().loadImageWith(path: logo) { (img) in
                self.imgLogo.image = img
            }
        }
        
        self.lblDescription.text = self.programming.description

        
    }
}
