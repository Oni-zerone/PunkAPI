//
//  BeersRequestTests.swift
//  PunkAPI_Example
//
//  Created by Andrea Altea on 02/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PunkAPI

class BeersRequestParametersTests: XCTestCase {
    
    func testABVParameterGreater() {
        let parameter = getParameter(.abv(condition: .more, value: 1.2))
        XCTAssert(parameter.key == "abv_gt")
        XCTAssert(1 == parameter.value as? Int)
    }
    
    func testABVParameterLessThan() {
        let parameter = getParameter(.abv(condition: .less, value: 1.2))
        XCTAssert(parameter.key == "abv_lt")
        XCTAssert(1 == parameter.value as? Int)
    }
    
    func testIBUParameterGreater() {
        let parameter = getParameter(.ibu(condition: .more, value: 1.2))
        XCTAssert(parameter.key == "ibu_gt")
        XCTAssert(1 == parameter.value as? Int)
    }
    
    func testIBUParameterLessThan() {
        let parameter = getParameter(.ibu(condition: .less, value: 1.2))
        XCTAssert(parameter.key == "ibu_lt")
        XCTAssert(1 == parameter.value as? Int)
    }
    
    func testEBCParameterGreater() {
        let parameter = getParameter(.ebc(condition: .more, value: 1.2))
        XCTAssert(parameter.key == "ebc_gt")
        XCTAssert(1 == parameter.value as? Int)
    }
    
    func testEBCParameterLessThan() {
        let parameter = getParameter(.ebc(condition: .less, value: 1.2))
        XCTAssert(parameter.key == "ebc_lt")
        XCTAssert(1 == parameter.value as? Int)
    }

    func testBeerNameParameter() {
        let parameter = getParameter(.beerName(value: "PunkIPA"))
        XCTAssert(parameter.key == "beer_name")
        XCTAssert("PunkIPA" == parameter.value as? String)
    }

    func testBeerNameParameterWithSpace() {
        let parameter = getParameter(.beerName(value: "Punk IPA"))
        XCTAssert(parameter.key == "beer_name")
        XCTAssert("Punk_IPA" == parameter.value as? String)
    }

    func testYeastParameter() {
        let parameter = getParameter(.yeast(value: "AmericanAle"))
        XCTAssert(parameter.key == "yeast")
        XCTAssert("AmericanAle" == parameter.value as? String)
    }
    
    func testYeastParameterWithSpace() {
        let parameter = getParameter(.yeast(value: "American Ale"))
        XCTAssert(parameter.key == "yeast")
        XCTAssert("American_Ale" == parameter.value as? String)
    }

    func testBrewedParameterBefore() {
        let parameter = getParameter(.brewed(condition: .less, value: Date(timeIntervalSinceReferenceDate: 5184000)))
        XCTAssert(parameter.key == "brewed_before")
        XCTAssert("03-2001" == parameter.value as? String)
    }
    
    func testBrewedParameterAfter() {
        let parameter = getParameter(.brewed(condition: .more, value: Date(timeIntervalSinceReferenceDate: 2592000)))
        XCTAssert(parameter.key == "brewed_after")
        XCTAssert("01-2001" == parameter.value as? String)
    }

    func testHopsParameter() {
        let parameter = getParameter(.hops(value: "Ahtanum"))
        XCTAssert(parameter.key == "hops")
        XCTAssert("Ahtanum" == parameter.value as? String)
    }
    
    func testHopsParameterWithSpace() {
        let parameter = getParameter(.hops(value: "Chi nook"))
        XCTAssert(parameter.key == "hops")
        XCTAssert("Chi_nook" == parameter.value as? String)
    }

    func testFoodParameter() {
        let parameter = getParameter(.food(value: "Cheesecake"))
        XCTAssert(parameter.key == "food")
        XCTAssert("Cheesecake" == parameter.value as? String)
    }
    
    func testFoodParameterWithSpace() {
        let parameter = getParameter(.food(value: "Spicy carne"))
        XCTAssert(parameter.key == "food")
        XCTAssert("Spicy_carne" == parameter.value as? String)
    }
    
    func testIdsParameterSingle() {
        let parameter = getParameter(.ids(value: [34]))
        XCTAssert(parameter.key == "ids")
        XCTAssert("34" == parameter.value as? String)
    }

    func testIdsParameterMultiple() {
        let parameter = getParameter(.ids(value: [34, 5, 21, 9]))
        XCTAssert(parameter.key == "ids")
        XCTAssert("34|5|21|9" == parameter.value as? String)
    }

    private func getParameter(_ requestParameter: BeersRequest.Parameter) -> RequestParameter {
        return requestParameter.parameter
    }
}
