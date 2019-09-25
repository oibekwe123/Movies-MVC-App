//
//  APIClient.swift
//  Movies MVC
//
//  Created by MAC on 2/25/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//
import Foundation
//Client is going to serve as a base to perform the kind of error
//Define a protocol and this is APICLient and  this API client is going to have a session and its properties is get
//going to have a fuctionality called a fetch and have a type called decodable and this fetch is going to have a fetch type url
//escaping is going to be helpful and completion handler

protocol APIClient {
    
    var session: URLSession {get}
   
    //fetch t which is going to comply with decodable.Making a constraint that comfront  with condable
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?,completion: @escaping (Result<T, APIError>) -> Void)
}

//get an extension to add more functionality to it. create a type alias
//Definiting the definition on what a class will do
extension APIClient {
    
    typealias JSONTaskCompletionHandler  = (Decodable?, APIError?) -> Void
    
    private func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        //.requestFailed is coming from the API Error.
        let task = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                
                return
            }
            
            //Use httResponse to parse jsonDecoder to try any error. if the response is an http then we proceed, if the data is more than 200 then we process the data , then if the response if less than 100 then is an invalid data
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel =  try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                    }
                        
                    catch {
                        completion(nil, .jsonConversionFailure)
                    }
                }else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }
    
    //create a func fetch and have an argument with the func and inside of this fun we are going to have a traditional arument
    
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) ->T?, completion: @escaping (Result<T, APIError>) -> Void) {
        
        //make a tast with a trailing closure and this trailing closure is going to have JsonResponse and an error and also use a DisPatchQuesus and also have a guard json to check the errrors
        
        let task = decodingTask(with: request, decodingType: T.self) { (json, error) in
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(Result.failure(error))
                    } else {
                        completion(Result.failure(.invalidData))
                    }
                    
                    return
                }
                
                if let value = decode(json) {
                    completion(.success(value))
                } else {
                    completion(.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
        
        
    }
}



