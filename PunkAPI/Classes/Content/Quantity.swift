//
//  Quantity.swift
//  PunkAPI
//
//  Created by Andrea Altea on 22/02/2019.
//

import Foundation

public struct Quantity: Codable {
    public var value: Float?
    public var unit: String?
}

public typealias Temperature = Quantity

public typealias Mass = Quantity

public typealias Volume = Quantity
