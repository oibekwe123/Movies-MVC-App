//
//  APIError.swift
//  Movies MVC
//
//  Created by MAC on 2/25/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import Foundation

enum APIError: Error {

//Made a case statement to tell which kind of error to be handled
 //for each of this case we are doing to have proper methods to handle the error
    case requestFailed
    case jsonConversionFailure
    case jsonParsingFailure
    case responseUnsuccessful
    case invalidData
  
    var localizedDescription: String {
    
    // process the case statement to handle the error
        switch self {
            
        case.requestFailed: return "Request failed"
        case.jsonConversionFailure: return "JSON Conversion failed"
        case.jsonParsingFailure: return "JSON Parsing failed"
        case.responseUnsuccessful: return "Response unsuccessful"
        case.invalidData: return "Invalid data"
        }
    }
    
    
}


