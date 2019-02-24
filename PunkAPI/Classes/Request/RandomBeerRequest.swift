//
//  RandomBeerRequest.swift
//  PunkAPI
//
//  Created by Andrea Altea on 24/02/2019.
//

import Foundation

public struct RandomBeerRequest: Request {
    
    public var path: String {
        return "beers/random"
    }
    
    public init() {  }
}
