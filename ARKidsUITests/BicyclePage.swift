//
//  BicyclePage.swift
//  ARKidsUITests
//
//  Created by Ivan Grebenyuk on 22.07.2020.
//  Copyright © 2020 Victor Sobolev. All rights reserved.
//

import XCTest

class Bicycle: BaseClass {
    lazy var boost = app.staticTexts["Boost for 100$"]
 
    func verifyBoostButtonExists() {
        XCTAssert(boost.exists,
                  "\(boost) button is not displayed, but it should be!")
    }
    
    func tapOnBoostButton() {
        boost.coordinate(withNormalizedOffset: .zero).tap()
    }
}
