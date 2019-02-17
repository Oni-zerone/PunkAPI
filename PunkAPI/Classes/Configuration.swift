//
//  Configuration.swift
//  PunkAPI
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public struct Configuration {
    
    var session: URLSession
    
    var baseComponent: URLComponents
    
    init(sessionConfiguration: URLSessionConfiguration) {
        
        self.session = URLSession(configuration: sessionConfiguration)
        self.baseComponent = URLComponents(string: "https://api.punkapi.com/v2/")!
    }
}
