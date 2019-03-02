//
//  BeersRequestTests.swift
//  PunkAPI_Tests
//
//  Created by Andrea Altea on 02/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PunkAPI

class BeersRequestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSingleParameter() {
        let request = BeersRequest(filter: [.abv(condition: .more, value: 34)])
        XCTAssert(request.path == "beers")
        XCTAssert(1 == request.parameters?.count)
        XCTAssert(34 == request.parameters?["abv_gt"] as? Int)
    }
    
    func testPageParameter() {
        let request = BeersRequest(page: 1)
        XCTAssert(request.path == "beers")
        XCTAssert(1 == request.parameters?.count)
        XCTAssert(1 == request.parameters?["page"] as? Int)
    }
    
    func testInvalidPageParameter() {
        let request = BeersRequest(page: 0)
        XCTAssert(request.path == "beers")
        XCTAssert(request.parameters == nil)
    }
    
    func testPageWithSingleParameter() {
        let request = BeersRequest(filter: [.abv(condition: .more, value: 34)], page: 1)
        XCTAssert(request.path == "beers")
        XCTAssert(2 == request.parameters?.count)
        XCTAssert(1 == request.parameters?["page"] as? Int)
        XCTAssert(34 == request.parameters?["abv_gt"] as? Int)
    }
}
