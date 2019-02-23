//
//  Method.swift
//  PunkAPI
//
//  Created by Andrea Altea on 22/02/2019.
//

import Foundation

public struct Method: Codable {
    
    public struct Step: Codable {
        public var temp: Temperature?
        public var duration: Float?
    }
    
    public var mashTemp: [Step]?
    public var fermentation: Temperature?
    public var twist: String?
}
