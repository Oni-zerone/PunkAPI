//
//  PunkAPI.swift
//  Pods-PunkAPI_Example
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public class PunkApi {
    
    var configuration: Configuration
    
    public init(configuration: Configuration = .default) {
        
        self.configuration = configuration
    }
    
    @discardableResult
    public func get(_ request: Request, queue: DispatchQueue = .global(qos: .background), completion: @escaping (Result<[Beer], Error>) -> Void) -> URLSessionDataTask? {
     
        guard let url = configuration.baseURL.url(request: request) else {
            queue.async { completion(.failure(APIError.invalidURL)) }
            return nil
        }

        let dataTask = self.configuration.session.dataTask(with: url) { (result: Result<[Beer], Error>) in
            queue.async { completion(result) }
        }
        dataTask.resume()
        return dataTask
    }
    
    @available(iOS 15.0, *)
    public func get(_ request: Request) async throws -> [Beer] {
        
        guard let url = configuration.baseURL.url(request: request) else {
            throw APIError.invalidURL
        }
        
        let data = try await self.configuration.session.data(for: URLRequest(url: url)).data
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([Beer].self, from: data)
    }
}

extension URLSession {
    
    @discardableResult
    func dataTask<Value: Decodable>(with url: URL, completion: @escaping (Result<Value, Error>) -> Void) -> URLSessionDataTask {
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
