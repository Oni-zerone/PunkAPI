//
//  Recipe.swift
//  Pods-PunkAPI_Example
//
//  Created by Andrea Altea on 22/02/2019.
//

import Foundation

public struct Recipe: Codable {
    
    public struct Ingredient: Codable {
        public var name: String?
        public var amount: Mass?
    }
    
    public var malt: [Ingredient]
    public var hops: [Ingredient]
    public var yeast: String?
}
