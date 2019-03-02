//
//  RequestParameter.swift
//  PunkAPI
//
//  Created by Andrea Altea on 02/03/2019.
//

import Foundation

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

enum Condition {
    case greater
    case lower
    
    var literal: String {
        switch self {
        case .greater: return "gt"
        case .lower: return "lt"
        }
    }
}
