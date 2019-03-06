//
//  PunkAPIPromiseInterfaceTests.swift
//  PunkAPI_Tests
//
//  Created by Andrea Altea on 04/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PromiseKit
@testable import PunkAPI

class PunkAPIPromiseInterfaceTests: XCTestCase {
    
    var mockSession: MockURLSession!
    var interface: PunkAPI!
    
    override func setUp() {
        
        mockSession = MockURLSession()
        let configuration = Configuration(session: mockSession, baseURL: URL(string: "https://api.test.it/v2/")!)
        interface = PunkAPI(configuration: configuration)
    }
    
    override func tearDown() {
        interface = nil
    }
    
    func testFailedRequest() {
        
        mockSession.check.urlCheckBlock = { url in
            XCTAssert("https://api.test.it/v2/beers/1" == url.absoluteString)
        }
        mockSession.check.responseConfig = (nil, nil, TestError.unknownError)
        
        interface.get(BeerRequest(id: 1))
            .done { (beers) in
                XCTFail("wrong response")
            }.catch { (error) in
                XCTAssert(TestError.unknownError == error as? TestError)
                
        }
    }
    
    func testEmptyData() {
        
        mockSession.check.urlCheckBlock = { url in
            XCTAssert("https://api.test.it/v2/beers/1" == url.absoluteString)
        }
        mockSession.check.responseConfig = (nil, nil, nil)
        
        interface.get(BeerRequest(id: 1))
            .done { (beers) in
                XCTFail("wrong response")
            }.catch { (error) in
                XCTAssert(APIError.emptyResponse == error as? APIError)
        }
    }
    
    func testValidResponse() {
        
        mockSession.check.urlCheckBlock = { url in
            XCTAssert("https://api.test.it/v2/beers/1" == url.absoluteString)
        }
        
        guard let beerData = BeerStub.multipleFirst.data(using: .utf8) else {
            XCTFail("Unable to define beerData")
            return
        }
        mockSession.check.responseConfig = (beerData, nil, nil)

        interface.get(BeerRequest(id: 1))
            .done { (beers) in
                let decodedBeers = try? JSONDecoder().decode([Beer].self, from: beerData)
                XCTAssert(beers == decodedBeers)
            }.catch { (error) in
                XCTFail("wrong response")
        }
    }
}
