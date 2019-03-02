//
//  FloatParameter.swift
//  PunkAPI
//
//  Created by Andrea Altea on 02/03/2019.
//

import Foundation

struct FloatParameter: RequestParameter {
    
    var type: String
    var condition: Condition
    var value: Any
    init(key: String, condition: Condition, value: Float) {
        self.type = key
        self.condition = condition
        self.value = value
    }
    var key: String {
        return "\(type)_\(condition.literal)"
    }
    
}
