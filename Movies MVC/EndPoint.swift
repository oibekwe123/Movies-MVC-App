//
//  EndPoint.swift
//  Movies MVC
//
//  Created by MAC on 2/25/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

protocol EndPoint {
    
    var base: String {get}
    var path: String {get}
    
}

extension EndPoint {
    
    var apiKey: String {
        return "api_key=a8e6b1f55d44eaa90d4b29cf57bbe9cf"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
    
}
