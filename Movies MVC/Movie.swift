//
//  Movie.swift
//  Movies MVC
//
//  Created by MAC on 2/25/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    var title : String?
    var poster_path: String?
    var overview: String?
    var backdrop_path: String?
    var release_date: String?
    
}
