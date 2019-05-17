//
//  Configuration.swift
//  PunkAPI
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public struct Configuration {
    
    var session: URLSession
    
    var baseURL: URL
    
    public init(sessionConfiguration: URLSessionConfiguration, baseURL: URL) {
        
        self.init(session: URLSession(configuration: sessionConfiguration),
                  baseURL: baseURL)
    }
    
    public init(session: URLSession, baseURL: URL) {
        
        self.session = session
        self.baseURL = baseURL
    }
}

public extension Configuration {
    
    static let `default` = Configuration(sessionConfiguration: .default,
                                                baseURL: URL(string: "https://api.punkapi.com/v2/")!)
}
