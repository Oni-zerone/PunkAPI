//
//  BeerRequest.swift
//  PunkAPI
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public struct BeerRequest: Request {
    
    public var id: Int
    
    public var path: String {
        return "beers/\(self.id)"
    }
    
    public init(id: Int) {
        self.id = id
    }
}
