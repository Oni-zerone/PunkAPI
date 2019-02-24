//
//  Result.swift
//  PunkAPI
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public enum Result<Value> {
    
    case success(Value)
    case failure(Error)
}
