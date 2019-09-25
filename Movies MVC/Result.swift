//
//  Result.swift
//  Movies MVC
//
//  Created by MAC on 2/25/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

//T for Type and U fpr protocol
enum Result<T, U> where U: Error {
   
    //process the case type and what error
    case success(T)
    case failure(U)
}
