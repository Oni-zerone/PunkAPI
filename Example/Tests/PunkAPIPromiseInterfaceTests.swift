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
    var interface: PunkApi!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        
        mockSession = MockURLSession()
        jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let configuration = Configuration(session: mockSession, baseURL: URL(string: "https://api.test.it/v2/")!)
        interface = PunkApi(configuration: configuration)
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
            .done { [weak self] (beers) in
                guard let decodedBeers = try? self?.jsonDecoder.decode([Beer].self, from: beerData) else {
                    XCTFail("unable to decode beers.")
                    return
                }
                XCTAssert(beers == decodedBeers)
            }.catch { (error) in
                XCTFail("wrong response")
        }
    }
}
