//
//  ViewController.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/28/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let vm = ListProgrammingVM()
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    @IBOutlet weak var tblListProgramming: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    private lazy var imageLoader = ImageLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        ///Search Bar
        
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        
        tblListProgramming.delegate = self
        tblListProgramming.dataSource = self
        self.vm.loadResouce()
        self.vm.completion = {
            self.reloadData()
        }
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tblListProgramming.reloadData()
        }
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.vm.isFiltering = self.isFiltering
        return self.vm.size
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameOfIdentifier.programmingCell, for: indexPath)
        if let item = self.vm.getItem(by: indexPath.row) {
            cell.textLabel?.text = item.title
            cell.imageView?.image = UIImage(named: "placeholder")
            if let logo = item.logo {
                self.imageLoader.loadImageWith(path: logo) { (img) in
                    if let updateCell = tableView.cellForRow(at: indexPath) {
                        updateCell.imageView?.image = img
                    }
                }
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProgramingDetailVC, let indexPath = tblListProgramming.indexPathForSelectedRow, let p = self.vm.getItem(by: indexPath.row) {
            vc.programming = p
        }
    }
    
    
}


extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        ///Todo:
        
        let searchBar = searchController.searchBar
        if let txt = searchBar.text {
            self.vm.filter(by: txt)
        }
    }
    
    
}
