//
//  MoviesAPIClient.swift
//  Movies MVC
//
//  Created by MAC on 2/25/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

class MoviesAPIClient: APIClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getFeed(from moviesEndpointType: MoviesEndPoint, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
        fetch(with: moviesEndpointType.request, decode: {
            json -> MovieFeedResult? in
            guard let movieFeedResult = json as? MovieFeedResult else {
                return nil
            }
            return movieFeedResult
        }, completion: completion)
    }
}
