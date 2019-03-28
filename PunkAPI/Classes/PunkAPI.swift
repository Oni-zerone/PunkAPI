//
//  PunkAPI.swift
//  Pods-PunkAPI_Example
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public class PunkAPI {
    
    var configuration: Configuration
    
    public init(configuration: Configuration = .default) {
        
        self.configuration = configuration
    }
    
    @discardableResult
    public func get(_ request: Request, queue: DispatchQueue = .global(qos: .background), completion: @escaping (Result<[Beer]>) -> Void) -> URLSessionDataTask? {
     
        guard let url = configuration.baseURL.url(request: request) else {
            queue.async { completion(.failure(APIError.invalidURL)) }
            return nil
        }

        let dataTask = self.configuration.session.dataTask(with: url) { (result: Result<[Beer]>) in
            queue.async { completion(result) }
        }
        dataTask.resume()
        return dataTask
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
