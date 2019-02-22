//
//  Method.swift
//  PunkAPI
//
//  Created by Andrea Altea on 22/02/2019.
//

import Foundation

public struct Method: Codable {
    
    struct Step: Codable {
        var temp: Quantity?
        var duration: Float?
    }
    
    var mashTemp: [Step]?
    var fermentation: Quantity?
    var twist: String?
}
