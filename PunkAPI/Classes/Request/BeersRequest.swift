//
//  BeersRequest.swift
//  PunkAPI
//
//  Created by Andrea Altea on 25/02/2019.
//

import UIKit

class BeersRequest {

    var page: Int
    
    init(page: Int = 0) {
        self.page = page
    }
    
}

extension BeersRequest: Request {
    
    var path: String {
        return "beers"
    }
}
