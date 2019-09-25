//
//  MoviesEndPoint.swift
//  Movies MVC
//
//  Created by MAC on 2/25/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

enum MoviesEndPoint {
    case nowPlaying
    case topRated
}


extension MoviesEndPoint: EndPoint {
    
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "/3/movie/now_playing"
        case .topRated:
            return "/3/movie/top_rated"
        }
    }
}
