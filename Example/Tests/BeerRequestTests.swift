//
//  BeerRequestTests.swift
//  PunkAPI_Tests
//
//  Created by Andrea Altea on 24/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PunkAPI

class BeerRequestTest: XCTestCase {
    
    func testRandomBeerRequest() {
        
        let request = RandomBeerRequest()
        XCTAssert(request.path == "beers/random")
        XCTAssert(request.parameters == nil)
    }
    
    func testBeerRequests() {
        
        self.testBeerRequest(with: 1)
        self.testBeerRequest(with: 2)
        self.testBeerRequest(with: 3)
        self.testBeerRequest(with: 4)
        self.testBeerRequest(with: 5)
        self.testBeerRequest(with: 6)
        self.testBeerRequest(with: 10)
        self.testBeerRequest(with: 1000)
        self.testBeerRequest(with: 165)
    }
    
    func testBeerRequest(with id: Int) {
        
        let request = BeerRequest(id: id)
        XCTAssert(request.path == "beers/\(id)")
        XCTAssert(request.parameters == nil)
    }
}
