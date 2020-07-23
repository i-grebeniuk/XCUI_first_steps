//
//  DoctorProfilePage.swift
//  ARKidsUITests
//
//  Created by Ivan Grebenyuk on 21.07.2020.
//  Copyright © 2020 Victor Sobolev. All rights reserved.
//

import XCTest


class DoctorProfile: BaseClass {
    
    lazy var profileTitle = app.staticTexts["Profile"]
    lazy var marketButton = app.buttons["marketIcon"]
    lazy var bycicleTitle = app.staticTexts["Bicycle"]
    lazy var propertyTitle = app.staticTexts["Property"]
    // Супер убогий локатор, смог найти его только с помошю тестрекордера. Элементы Property или Risk !hittable  и не нажимаются
    lazy var boughtProductBlock = app.tables.cells.otherElements.cells.children(matching: .button).element
    func openMarket(){
        marketButton.tap()
    }
    
    func verifyBoughtProductAdded(product: XCUIElement){
        XCTAssert(product.exists,
                        "\(product) is not displayed, but it should be!")
//        XCTAssert(app.buttons[product].exists,
//                  "\(product) is not displayed, but it should be!")
    }
    
    func openBoughtProduct(){
        boughtProductBlock.tap()
    }
}
