//
//  PunkAPIInterfaceTests.swift
//  PunkAPI_Tests
//
//  Created by Andrea Altea on 03/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PunkAPI

enum TestError: Error {
    case unknownError
}

class PunkAPIInterfaceTests: XCTestCase {

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
        
        interface.get(BeerRequest(id: 1)) { beerResult in
            switch beerResult {
            
            case let .failure(error):
                XCTAssert(TestError.unknownError == error as? TestError)
                
            default:
                XCTFail("wrong response")
            }
        }
    }
    
    func testEmptyData() {
        
        mockSession.check.urlCheckBlock = { url in
            XCTAssert("https://api.test.it/v2/beers/1" == url.absoluteString)
        }
        mockSession.check.responseConfig = (nil, nil, nil)
        
        interface.get(BeerRequest(id: 1)) { beerResult in
            switch beerResult {
                
            case let .failure(error):
                XCTAssert(APIError.emptyResponse == error as? APIError)
                
            default:
                XCTFail("wrong response")
            }
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
        
        interface.get(BeerRequest(id: 1)) { beerResult in
            switch beerResult {
                
            case let .success(beers):
                
                let decodedBeers = try? JSONDecoder().decode([Beer].self, from: beerData)
                XCTAssert(beers == decodedBeers)
                
            default:
                XCTFail("wrong response")
            }
        }
    }
}

extension Configuration {
    
    init(session: URLSession, baseURL: URL) {
        self.init(sessionConfiguration: .default, baseURL: baseURL)
        self.session = session
    }
}
