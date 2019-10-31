//
//  ServiceProvider.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/28/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import Foundation
struct ServiceProvider {
    
    // MARK:- Initialize
    private init() {}
    /// Instant of WSManager
    private let ws = WSManager.shareInstance
    

    /// Instance class
    public static var share: ServiceProvider {
        get { return ServiceProvider() }
    }
    
    func fetchProgramming(completion: @escaping ([Programming]?)->()) {
        
        ws.request(resource: APIResource<[Programming]>.listProgramming) { (result) in
            switch result {
                
            case .success(let programming):
                //print("Programming obj", programming)
                completion(programming)
            case .failure(let err):
                
                switch err {
                case .decodingError:
                    print("Error Decoding")
                case .domainError:
                    print("Error Domain")
                case .urlError:
                    print("Error URL")
                case .custom(let msg):
                    print("Error", msg)
                case .serverError:
                    print("Server Error")
                }
            }
        }
    }
}
