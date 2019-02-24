//
//  MockSession.swift
//  PunkAPI_Tests
//
//  Created by Andrea Altea on 24/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {
    
    var urlCheckBlock: ((_ url: URL) -> Void)?
    
    var responseConfig: (data: Data?, response: HTTPURLResponse?, error: Error?)?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        if let urlCheckBlock = self.urlCheckBlock {
            urlCheckBlock(url)
        }
        
        return MockSessionDataTask(config: self.responseConfig, completionHandler: completionHandler)
    }
}

class MockSessionDataTask: URLSessionDataTask {
    
    enum DataError: String, ConvertibleError {
        
        case notConfigured = "Not Configured"
    }
    
    var config: (data: Data?, response: HTTPURLResponse?, error: Error?)?
    
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    
    init(config: (data: Data?, response: HTTPURLResponse?, error: Error?)?, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        self.config = config
        self.completionHandler = completionHandler
    }
    
    override func resume() {
        
        guard let config = self.config else {
            
            completionHandler(nil, nil, DataError.notConfigured)
            return
        }
        completionHandler(config.data, config.response, config.error)
    }
}

protocol ConvertibleError: Error {
    
    var message: String { get }
}

extension ConvertibleError where Self: RawRepresentable, Self.RawValue == String{
    
    var message: String {
        return self.rawValue
    }
}
