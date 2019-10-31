//
//  WelcomeVC.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/31/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import UIKit

class WelcomeVC: UITableViewController {
    
    private var data: [ScreenType]!

    override func viewDidLoad() {
        super.viewDidLoad()
        data = ScreenType.allCases

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameOfIdentifier.welcomeCell, for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screen = data[indexPath.row]
        if screen != .welcome { Switcher.share.switchScreen(to: screen) }
    }

}
