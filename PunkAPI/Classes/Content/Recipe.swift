//
//  Recipe.swift
//  Pods-PunkAPI_Example
//
//  Created by Andrea Altea on 22/02/2019.
//

import Foundation

public struct Recipe: Codable {
    
    public struct Ingredient: Codable {
        var name: String?
        var amount: Quantity?
    }
    
    var malt: [Ingredient]
    var hops: [Ingredient]
    var yeast: String?
}
