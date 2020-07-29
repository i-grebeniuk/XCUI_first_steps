//  DoctorProfilePage.swift
//  ARKidsUITests
//
//  Created by Ivan Grebenyuk on 21.07.2020.
//  Copyright © 2020 Victor Sobolev. All rights reserved.
//

import XCTest

class Profile: BaseClass {
    
    lazy var profileTitle = app.staticTexts["Profile"]
    lazy var marketButton = app.buttons["marketIcon"]
    lazy var bycicleTitle = app.staticTexts["Bicycle"]
    lazy var propertyTitle = app.staticTexts["Property"]
    lazy var myProductsLabel = app.staticTexts["My Products"]
    
    func openMarket(){
        marketButton.tap()
    }
    
    func verifyMarketButtonIsDisplayed(){
        XCTAssert(marketButton.exists,
        "\(marketButton) is not displayed, but it should be!")
    }
    
    func verifyBoughtProductAdded(product: XCUIElement){
        XCTAssert(product.exists,
                        "\(product) is not displayed, but it should be!")
    }
    
    func openBoughtProduct(_ elelemnt: XCUIElement){
        elelemnt.coordinate(withNormalizedOffset: .zero).tap()
    }
    
}
