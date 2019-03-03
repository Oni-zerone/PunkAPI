//
//  StringParameter.swift
//  PunkAPI
//
//  Created by Andrea Altea on 02/03/2019.
//

import Foundation

struct StringParameter: RequestParameter {
    
    var key: String
    var value: Any
    
    init(key: String, value: String) {
        self.key = key
        self.value = value.replacingOccurrences(of: " ", with: "_")
    }
}
