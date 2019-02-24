//
//  URLBuildTests.swift
//  PunkAPI_Example
//
//  Created by Andrea Altea on 24/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PunkAPI

class URLBuildTests: XCTestCase {
    
    var baseURL: URL!
    
    override func setUp() {
        super.setUp()
        
        self.baseURL = URL(string: "https://api.test.it/v2")
    }
    
    func testBaseURLBuilding() {
        
        let request = MockRequest(path: "beer/1", parameters: nil)
        let url = self.baseURL.url(request: request)
        XCTAssert(url?.absoluteString == "https://api.test.it/v2/beer/1")
    }
    
    func testWrongRelativePathURLBuilding() {
        
        let request = MockRequest(path: "/beer/1", parameters: nil)
        let url = self.baseURL.url(request: request)
        XCTAssert(url?.absoluteString == "https://api.test.it/v2/beer/1")
    }

    func testParametersURLBuilding() {
        
        let request = MockRequest(path: "/beer",
                                  parameters: ["integer": 1, "string": "text", "object": NSNumber(value: 3)])
        guard let url = self.baseURL.url(request: request) else {
            return XCTFail("undefined url")
        }
        guard let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems else {
            return XCTFail("undefined query")
        }
        XCTAssert(queryItems.count == 3)
        XCTAssert(queryItems.contains(URLQueryItem(name: "integer", value: "1")))
        XCTAssert(queryItems.contains(URLQueryItem(name: "string", value: "text")))
        XCTAssert(queryItems.contains(URLQueryItem(name: "object", value: "3")))
    }
}

struct MockRequest: Request {
    
    var path: String
    var parameters: [String : Any]? = nil
}
