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
    
    enum Goods: String {
        case stockTrading = "Only premium"
        case property = "40000 $"
        case deposit = "100 $"
        case bicycle = "300 $"
    }
    
    func buyProduct(_ good: Goods){
        app.buttons[good.rawValue].tap()
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
