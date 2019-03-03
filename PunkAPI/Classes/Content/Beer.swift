//
//  Beer.swift
//  PunkAPI
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public struct Beer: Codable {
    
    public var id: Int
    public var name: String?
    public var tagline: String?
    public var firstBrewed: String?
    public var description: String?
    public var imageUrl: String?
    
    public var abv: Float?
    public var ibu: Float?
    
    public var targetFg: Float?
    public var targetOg: Float?
    
    public var ebc: Float?
    public var srm: Float?
    public var ph: Float?
    
    public var attenuationLevel: Float?
    public var volume: Volume?
    public var boilVolume: Volume?
    public var method: Method?
    public var ingredients: Recipe?
    public var foodPairing: [String]
    public var brewersTips: String?
    public var contributedBy: String?
}
