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
    
    func getBeer(_ request: Request, completion: @escaping (Result<Response>) -> Void) {
        
    }
}
