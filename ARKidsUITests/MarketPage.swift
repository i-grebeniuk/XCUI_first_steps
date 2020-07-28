//
//  MarketPage.swift
//  ARKidsUITests
//
//  Created by Ivan Grebenyuk on 21.07.2020.
//  Copyright © 2020 Victor Sobolev. All rights reserved.
//

import XCTest

class Market: BaseClass {
    lazy var  marketTitle = app.navigationBars["Market"]
    lazy var profileButton = app.buttons["Profile"]
    lazy var congratulationsAlert = app.alerts["Congratulations!"]
    lazy var congratulationsAlertText = app.alerts.staticTexts["You've just invested in the 0.8% deposit"]
    lazy var thanksButton = app.alerts.buttons["Thanks!"]
    
    enum Goods: String {
        case stockTrading = "Only premium"
        case property = "40000 $"
        case deposit = "100 $"
        case bicycle = "300 $"
    }
    
    func buyProduct(_ good: Goods){
        app.buttons[good.rawValue].tap()
    }
    
    func productExists(_ good: Goods){
        XCTAssert(app.buttons[good.rawValue].exists,
                  "Prdocut \(app.buttons[good.rawValue]) is not displayed, but it should be!")
    }
    
    func verifyAlertAppears() {
        XCTAssert(congratulationsAlert.exists,
                  "\(congratulationsAlert) in not displayed, but is should be!")
        XCTAssert(congratulationsAlertText.exists,
                  "Text on alert message is wrong! Correct test is: \"You've just invested in the 0.8% deposit\"")
    }
    
    func verifyAlertClosed(){
        XCTAssert(!congratulationsAlertText.exists, "\(congratulationsAlert) alert is displayed, but it should NOT be")
        XCTAssert(!congratulationsAlertText.exists, "\(congratulationsAlertText) alert is displayed, but it should NOT be")
    }
    
    func closeCongratulationsAlert(){
        thanksButton.tap()
    }
    
    func productIsDisabledafterBuying(_ good: Goods){
        let boughtProduct = app.buttons[good.rawValue]
        XCTAssert(!boughtProduct.isEnabled,
                  "\(boughtProduct) button is not disabled, but it should be!")
    }
    
    func backToProfilePage(){
        profileButton.tap()
    }
    
}
