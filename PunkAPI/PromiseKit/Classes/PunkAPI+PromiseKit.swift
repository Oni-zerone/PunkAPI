//
//  PunkAPI+PromiseKit.swift
//  PunkAPI
//
//  Created by Andrea Altea on 17/02/2019.
//

import Foundation
import PromiseKit

public extension PunkAPI {
    func get(_ request: Request) -> Promise<[Beer]> {
        return Promise { resolver in
            self.perform(request, resolver: resolver)
        }
    }
    
    fileprivate func perform(_ request: Request, resolver: Resolver<[Beer]>) {
        
        self.get(request) { result in
            switch result {
            case let .success(beers):
                resolver.fulfill(beers)
                
            case let .failure(error):
                resolver.reject(error)
            }
        }
    }
}
