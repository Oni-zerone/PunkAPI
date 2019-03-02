//
//  BeersRequest.swift
//  PunkAPI
//
//  Created by Andrea Altea on 25/02/2019.
//

import UIKit

public struct BeersRequest {

    public var page: Int
    public var filter: [BeersRequest.Parameter]

    public init(filter:[BeersRequest.Parameter] = [], page: Int = 0) {
        self.filter = filter
        self.page = page
    }
}

extension BeersRequest: Request {
    
    public var path: String {
        return "beers"
    }
    
    public var parameters: [String: Any]? {
        
        guard page > 0 else { return filterParameters }

        var parameters = filterParameters ?? [:]
        parameters["page"] = page
        return parameters
    }
}

extension BeersRequest {

    var filterParameters: [String: Any]? {
        
        if filter.isEmpty { return nil }
        
        return filter.map { parameter -> RequestParameter in
            return parameter.parameter
            }.reduce(into: [:], { (result, parameter) in
                result[parameter.key] = parameter.value
            })
    }
}
