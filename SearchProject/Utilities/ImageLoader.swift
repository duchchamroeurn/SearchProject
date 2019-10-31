//
//  ImageLoader.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/29/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import UIKit

class ImageLoader: NSObject {
    private var tasks: URLSessionDownloadTask!
    private var session: URLSession!
    private var caches: [String: UIImage]!
    
    typealias ImageCacheLoaderCompletionHandler = ((UIImage) -> ())
    
    override init() {
        super.init()
        session = URLSession.shared
        caches = [:]
    }
    
    func loadImageWith(path: String, completion: @escaping ImageCacheLoaderCompletionHandler) {
        
        
        ///Load image from cache
        if let img = self.caches[path] {
            DispatchQueue.main.async {
                completion(img)
            }
        } else {
            guard let url = URL(string: path) else { return }
            
            tasks = session.downloadTask(with: url, completionHandler: { (location, response, error) in

                if let pathURL = location, let data = try? Data(contentsOf: pathURL) {
                    if let img = UIImage(data: data) {
                        self.caches[path] = img
                        DispatchQueue.main.async {
                            completion(img)
                        }
                    }
                }
            })
            tasks.resume()
        }
        
        
        
    }
}
