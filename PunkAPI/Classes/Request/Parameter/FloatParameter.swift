//
//  IntParameter.swift
//  PunkAPI
//
//  Created by Andrea Altea on 02/03/2019.
//

import Foundation

struct IntParameter: RequestParameter {
    
    var type: String
    var condition: Condition
    var value: Any
    init(key: String, condition: Condition, value: Float) {
        self.type = key
        self.condition = condition
        self.value = Int(value)
    }
    var key: String {
        return "\(type)_\(condition.dimension)"
    }
}
