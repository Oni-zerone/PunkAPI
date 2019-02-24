//
//  ConfigurationTests.swift
//  PunkAPI_Tests
//
//  Created by Andrea Altea on 24/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PunkAPI

class ConfigurationTests: XCTestCase {

    func testConfigurationBuild() {
        
        let baseURL = URL(string: "test://api.test.it/")!
        let configuration = Configuration(sessionConfiguration: .ephemeral, baseURL: baseURL)
        
        XCTAssert(configuration.baseURL == baseURL)
    }
    
    func testDefaultConfiguration() {
        
        let configuration = Configuration.default
        XCTAssert(configuration.baseURL.absoluteString == "https://api.punkapi.com/v2/")
    }
}
