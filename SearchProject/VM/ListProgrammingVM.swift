//
//  ListProgrammingVM.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/28/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import Foundation

class ListProgrammingVM {
    var completion: (()->Void)?
    
    public var isFiltering: Bool = false
    
    private var listProgramming: [Programming]? {
        willSet { self.completion?() }
    }
    
    private var filterProgramming: [Programming]? {
        willSet { self.completion?() }
    }
    
    var size: Int {
        get {
            return isFiltering ? self.filterProgramming?.count ?? 0 : self.listProgramming?.count ?? 0
        }
    }
    
    func loadResouce() {
        ServiceProvider.share.fetchProgramming { (p) in
            if let data = p {
                self.listProgramming = data
            }
        }
    }
    
    func getItem(by id: Int) -> Programming? {
        return isFiltering ? self.filterProgramming?[id] : self.listProgramming?[id]
    }
    
    func filter(by title: String) {
        guard let items = self.listProgramming else {return}
        let result = items.filter{$0.title.lowercased().contains(title.trimmingCharacters(in: .whitespaces).lowercased())}
        
        print("Filter Data", result)
        
        self.filterProgramming = result
    }
    
    
}
