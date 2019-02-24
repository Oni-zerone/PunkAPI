//
//  PunkAPI.swift
//  Pods-PunkAPI_Example
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public class PunkAPI {
    
    var configuration: Configuration
    
    public init(sessionConfiguration: URLSessionConfiguration) {
        
        self.configuration = Configuration(sessionConfiguration: sessionConfiguration)
    }
    
    public convenience init() {
        self.init(sessionConfiguration: .default)
    }
    
    public func get(_ request: Request, queue: DispatchQueue = .global(qos: .background), completion: @escaping (Result<[Beer]>) -> Void) {
     
        var urlComponent = self.configuration.baseComponent
        urlComponent.path += request.path
        guard let url = urlComponent.url else {
            queue.async { completion(.failure(APIError.invalidURL)) }
            return
        }

        self.configuration.session.dataTask(with: url) { (result: Result<[Beer]>) in
            queue.async { completion(result) }
        }.resume()
    }
}

extension URLSession {
    
    func dataTask<Value: Decodable>(with url: URL, completion: @escaping (Result<Value>) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { (data, response, error) in

            do  {
                if let error = error {
                    throw error
                }
                
                guard let data = data else {
                    throw APIError.emptyResponse
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let beers = try decoder.decode(Value.self, from: data)
                completion(.success(beers))
                
            } catch let error {
                completion(.failure(error))
            }
        }
    }
}
