//
//  BeersRequestParameter.swift
//  PunkAPI
//
//  Created by Andrea Altea on 02/03/2019.
//

import Foundation

extension BeersRequest {
    
    public enum Parameter {
        
        case abv(condition: Condition, value: Int)
        case ibu(condition: Condition, value: Int)
        case ebc(condition: Condition, value: Int)
        
        case beerName(value: String)
        case yeast(value: String)
        
        case brewed(condition: Condition, value: Date)
        
        case hops(value: String)
        case malt(value: String)
        case food(value: String)
        
        case ids(value: [Int])
    }
}

extension BeersRequest.Parameter {
    
    
    internal var parameter: RequestParameter {
        switch self {
        case let .abv(condition, value):
            return IntParameter(key: "abv", condition: condition, value: value)
        case let .ibu(condition, value):
            return IntParameter(key: "ibu", condition: condition, value: value)
        case let .ebc(condition, value):
            return IntParameter(key: "ebc", condition: condition, value: value)
            
        case let .beerName(value):
            return StringParameter(key: "beer_name", value: value)
        case let .yeast(value):
            return StringParameter(key: "yeast", value: value)
            
        case let .brewed(condition, value):
            return DateParameter(type: "brewed", condition: condition, dateValue: value)
            
        case let .hops(value):
            return StringParameter(key: "hops", value: value)
        case let .malt(value):
            return StringParameter(key: "malt", value: value)
        case let .food(value):
            return StringParameter(key: "food", value: value)
            
        case let .ids(value):
            let ids = value.map { "\($0)" }.reduce("", { $0.isEmpty ? $1 : $0 + "|" + $1 })
            return StringParameter(key: "ids", value: ids)
        }
    }
}
