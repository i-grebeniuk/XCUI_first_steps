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
    lazy var balance = app.cells.element(boundBy: 1).staticTexts.element(boundBy: 1)
    
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
    
    func getBalance() -> Int {
        balance.waitForExistence(timeout: 2)
        let arrayOfString = balance.label.components(separatedBy: " ")
        let balanceValue = Int(arrayOfString[0])
        return balanceValue!
    }
    
    func verifyBalanceChanged(_ oldValue: Int, _ newValue: Int, _ productPrice: Int) {
        XCTAssertEqual(newValue, oldValue - productPrice,
                       "New value must be \(oldValue - productPrice), but it is \(newValue)")
    }
}
