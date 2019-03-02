//
//  Request.swift
//  Pods-PunkAPI_Example
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public protocol Request {
    
    var path: String { get }
    
    var parameters: [String: Any]? { get }
}

public extension Request {
    
    var parameters: [String: Any]? {
        return nil
    }
}

protocol RequestParameter {
    
    var key: String { get }
    var value: Any { get }
}

extension Array where Element: RequestParameter {
    
    var parameters: [String: Any] {
        return self.reduce(into: [:], { (result, parameter) in
            result[parameter.key] = parameter.value
        })
    }
}
