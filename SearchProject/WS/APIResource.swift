//
//  APIResource.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/28/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case GET
    case POST
}

enum AuthorizationType {
    case none
    case bearer
}

protocol TargetResource {
    
    /// The target's base `URL`.
    var baseURL: URL { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    /// The HTTP method used in the request.
    var method: HttpMethod { get }
    
    var body: Data? { get }
    
    var authorizeType: AuthorizationType { get }
}


enum APIResource<T: Codable> {
    case listProgramming
}


extension APIResource: TargetResource {
    var baseURL: URL {
        guard let url = URL(string: NameOfWS.BASE_URL) else { fatalError("Invalid Base URL.") }
        return url
    }
    
    var path: String {
        switch self {
        case .listProgramming:
            return "list-programming"
        }
    }
    
    var method: HttpMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var body: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var authorizeType: AuthorizationType {
        switch self {
        default:
            return .none
        }
    }
    
    
}
