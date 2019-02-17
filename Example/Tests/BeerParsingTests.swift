//
//  BeerParsingTests.swift
//  PunkAPI_Tests
//
//  Created by Andrea Altea on 17/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PunkAPI

class BeerParsingTests: XCTestCase {

    var parser: JSONDecoder!
    
    override func setUp() {

        let parser = JSONDecoder()
        parser.keyDecodingStrategy = .convertFromSnakeCase
        self.parser = parser
    }

    override func tearDown() {
        self.parser = nil
    }

    func testFirst() {
        
        self.decodeBeers(BeerStub.first)
    }

    func testSecond() {
        
        self.decodeBeers(BeerStub.second)
    }

    func testThird() {
        
        self.decodeBeers(BeerStub.third)
    }

    func testFourth() {
        
        self.decodeBeers(BeerStub.fourth)
    }

    func testFifth() {
        
        self.decodeBeers(BeerStub.fifth)
    }

    func testMultipleFirst() {
        self.decodeBeers(BeerStub.multipleFirst)
    }

    func testMultipleSecond() {
        self.decodeBeers(BeerStub.multipleSecond)
    }

    @discardableResult
    func decodeBeers(_ json: String) -> [Beer]?  {
        
        do {
            guard let data = json.data(using: .utf8) else {
                XCTFail("invalid stub")
                return nil
            }
            return try self.parser.decode([Beer].self, from: data)
        } catch let error {
            XCTFail(error.localizedDescription)
            return nil
        }
    }
}
