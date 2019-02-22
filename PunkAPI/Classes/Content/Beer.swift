//
//  Beer.swift
//  PunkAPI
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation

public struct Beer: Codable {
    
    var id: Int
    var name: String?
    var tagline: String?
    var firstBrewed: String?
    var description: String?
    var imageUrl: String?
    
    var abv: Float?
    var ibu: Float?
    
    var targetFg: Float?
    var targetOg: Float?
    
    var ebc: Float?
    var srm: Float?
    var ph: Float?
    
    var attenuationLevel: Float?
    var volume: Volume?
    var boilVolume: Volume?
    var method: Method?
    var ingredients: Recipe?
    var foodPairing: [String]
    var brewersTips: String?
    var contributedBy: String?
}
