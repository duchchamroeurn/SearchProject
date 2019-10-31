//
//  WSManager.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/28/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
    case serverError
    case custom(msg: String)
}

enum ENV {
    case dev
    case pro
}

fileprivate struct Response<T: Codable>: Codable {
    let message: String
    let data: T
    let success: Bool
}


class WSManager {
    public static let shareInstance = WSManager()
    public var env: ENV = .dev
    
    private init() {}
    
    var arr = ["abc"]
    public func request<T>(resource: APIResource<T>, completion: @escaping (Result<T, NetworkError>)->()) {
        
        
        let request = self.urlRequest(resource)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.serverError))
                    return
            }
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Response<T>.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result.data))
                }
            } catch {
                completion(.failure(.decodingError))
            }
            }.resume()
        
    }
    
    private func urlRequest<T>(_ resource: APIResource<T>) -> URLRequest {
        
        let url = resource.baseURL.appendingPathComponent(resource.path)
        var request = URLRequest(url: url)
        request.httpMethod = resource.method.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if resource.authorizeType == .bearer {
//            if let token = UserHelper.USER_TOKEN {
//                 request.addValue("\(token.token_type) \(token.access_token)", forHTTPHeaderField: "Authorization")
//            }
           
        }
        
        return request
    }

}
