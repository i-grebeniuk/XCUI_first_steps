//
//  ARKidsUITests.swift
//  ARKidsUITests
//
//  Created by Ivan Grebenyuk on 20.07.2020.
//  Copyright © 2020 Victor Sobolev. All rights reserved.
//

import XCTest

class ARKidsUITests: BaseClass {
    
// Test Scenario 1
    func testDoctorButtonExists() {
        let startPage = StartPage()
        feature("Start screen")
        name("Verify Doctor button exists")
        app.launch()
        startPage.verifyProfessionExists(.Doctor)
    }
    
    func testProductButtonIsDisabledAfterBuying() {
        let startPage = StartPage()
        let profilepage = Profile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Doctor)
        profilepage.openMarket()
        marketPage.buyProduct(.property)
        marketPage.productButtonIsDisabled(.property)
    }
    
    func testProductAddedToProfilePage() {
        let startPage = StartPage()
        let profilePage = Profile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Doctor)
        profilePage.openMarket()
        marketPage.buyProduct(.property)
        marketPage.backToProfilePage()
        profilePage.scrollDownToVisibleElement(profilePage.propertyTitle)
        profilePage.verifyBoughtProductAdded(product: profilePage.propertyTitle)
    }

    func testTapOnBoostButton() {
        let startPage = StartPage()
        let profilePage = Profile()
        let marketPage = Market()
        let bicyclePage = Bicycle()
        app.launch()
        startPage.openProfilePage(.Doctor)
        profilePage.openMarket()
        marketPage.buyProduct(.property)
        marketPage.backToProfilePage()
        profilePage.scrollDownToVisibleElement(profilePage.propertyTitle)
        profilePage.openBoughtProduct(profilePage.propertyTitle)
        bicyclePage.verifyBoostButtonExists()
        bicyclePage.tapOnBoostButton()
        }
    
    // Test Scenario2
    func testMechanicButtonExists() {
        let startPage = StartPage()
        app.launch()
        startPage.verifyProfessionExists(.Mechanic)
    }
    
    func testMarketButtonExists() {
        let startPage = StartPage()
        let profilePage = Profile()
        app.launch()
        startPage.openProfilePage(.Mechanic)
        profilePage.scrollDownToVisibleElement(profilePage.myProductsLabel)
        profilePage.scrollUpToVisibleElement(profilePage.marketButton)
        profilePage.verifyMarketButtonIsDisplayed()
    }
    
    func testDepositButtonExists() {
        let startPage = StartPage()
        let profilePage = Profile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Mechanic)
        profilePage.openMarket()
        marketPage.productExists(.deposit)
    }
    
    func testCongratulatonsAlertExists() {
        let startPage = StartPage()
        let profilePage = Profile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Mechanic)
        profilePage.openMarket()
        marketPage.buyProduct(.deposit)
        marketPage.verifyAlertAppears()
    }
    
    func testAlertDisappearsAfterClosig() {
        let startPage = StartPage()
        let profilePage = Profile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Mechanic)
        profilePage.openMarket()
        marketPage.buyProduct(.deposit)
        marketPage.closeCongratulationsAlert()
        marketPage.verifyAlertClosed()
    }
// Test scenario 3
    func testGardenerButtonExists() {
        let startPage = StartPage()
        app.launch()
        startPage.verifyProfessionExists(.Gardener)
    }
    
    func testMarketButtonForGardener() {
        let startPage = StartPage()
        let profilePage = Profile()
        app.launch()
        startPage.openProfilePage(.Gardener)
        profilePage.scrollDownToVisibleElement(profilePage.myProductsLabel)
        profilePage.scrollUpToVisibleElement(profilePage.marketButton)
        profilePage.verifyMarketButtonIsDisplayed()
    }
    func testStocksButtonExists() {
        let startPage = StartPage()
        let profilePage = Profile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Gardener)
        profilePage.openMarket()
        marketPage.productExists(.stockTrading)
    }
    func testStocksButtonIsDisabled() {
        let startPage = StartPage()
        let profilePage = Profile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Gardener)
        profilePage.openMarket()
        marketPage.productExists(.stockTrading)
        marketPage.buyProduct(.stockTrading)
        marketPage.productButtonIsDisabled(.stockTrading)
      }
// Test scenario 4
    
    func tsstGardenerButtonExists(){
        let startPage = StartPage()
        app.launch()
        startPage.verifyProfessionExists(.Gardener)
    }
    
    func testBalanceChagesAfterBuying(){
        let startPage = StartPage()
        let profilePage = Profile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Gardener)
        let oldBalance = profilePage.getPrice(profilePage.balance)
        profilePage.openMarket()
        let productPrice = marketPage.getPrice(app.buttons["40000 $"])
        marketPage.buyProduct(.property)
        marketPage.backToProfilePage()
        let newBalance = profilePage.getPrice(profilePage.balance)
        profilePage.verifyBalanceChanged(oldBalance, newBalance, productPrice)
    }
}
