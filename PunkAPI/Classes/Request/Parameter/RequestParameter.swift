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

public enum Condition {
    case more
    case less
}

extension Condition {
    
    var dimension: String {
        switch self {
        case .more: return "gt"
        case .less: return "lt"
        }
    }

    var time: String {
        switch self {
        case .more: return "after"
        case .less: return "before"
        }
    }
}
