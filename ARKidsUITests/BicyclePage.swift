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
    // Уродский локатор, получил его из тестРекордера, так как лэбел "Boost for 100$" !.isHittable
    lazy var boostButton = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element
    func verifyBoostButtonExists() {
        XCTAssert(boost.exists)
    }
    
    func tapOnBoostButton() {
        boostButton.tap()
    }
}
