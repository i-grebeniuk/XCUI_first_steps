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
        app.launch()
        startPage.verifyProfessionExists(.Doctor)
    }
    
    func testProductButtonIsDisabledAfterBuying() {
        let startPage = StartPage()
        let doctorProfilePage = DoctorProfile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Doctor)
        doctorProfilePage.openMarket()
        marketPage.buyProduct(.property)
        marketPage.productIsDisabledafterBuying(.property)
    }
    
    func testBProductAddedToProfilePage() {
        let startPage = StartPage()
        let doctorProfilePage = DoctorProfile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Doctor)
        doctorProfilePage.openMarket()
        marketPage.buyProduct(.property)
        marketPage.backToProfilePage()
        doctorProfilePage.scrollDownToVisibleElement(doctorProfilePage.propertyTitle)
        doctorProfilePage.verifyBoughtProductAdded(product: doctorProfilePage.propertyTitle)
    }

    func testTapOnBoostButton() {
        let startPage = StartPage()
        let doctorProfilePage = DoctorProfile()
        let marketPage = Market()
        let bicyclePage = Bicycle()
        app.launch()
        startPage.openProfilePage(.Doctor)
        doctorProfilePage.openMarket()
        marketPage.buyProduct(.property)
        marketPage.backToProfilePage()
        doctorProfilePage.scrollDownToVisibleElement(doctorProfilePage.propertyTitle)
        doctorProfilePage.openBoughtProduct(doctorProfilePage.propertyTitle)
        bicyclePage.verifyBoostButtonExists()
        bicyclePage.tapOnBoostButton()
        }
    
    // Test Scenario2
    func testVerifyMechancButtonExists() {
        let startPage = StartPage()
        app.launch()
        startPage.verifyProfessionExists(.Mechanic)
    }
    
    func testMarketButtonExists() {
        let startPage = StartPage()
        let mechanicProfilePage = MechanicProfile()
        app.launch()
        startPage.openProfilePage(.Mechanic)
        mechanicProfilePage.scrollDownToVisibleElement(mechanicProfilePage.myProductsLabel)
        mechanicProfilePage.scrollUpToVisibleElement(mechanicProfilePage.marketButton)
        mechanicProfilePage.verifyMarketButtonIsDisplayed()
    }
    
    func testDeositButtonExists() {
        let startPage = StartPage()
        let mechanicProfilePage = MechanicProfile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Mechanic)
        mechanicProfilePage.openMarket()
        marketPage.productExists(.deposit)
    }
    
    func testCongratulatonsAlertExists() {
        let startPage = StartPage()
        let mechanicProfilePage = MechanicProfile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Mechanic)
        mechanicProfilePage.openMarket()
        marketPage.buyProduct(.deposit)
        marketPage.verifyAlertAppears()
    }
    
    func testAlertDisappearsAfterClosig() {
        let startPage = StartPage()
        let mechanicProfilePage = MechanicProfile()
        let marketPage = Market()
        app.launch()
        startPage.openProfilePage(.Mechanic)
        mechanicProfilePage.openMarket()
        marketPage.buyProduct(.deposit)
        marketPage.closeCongratulationsAlert()
        marketPage.verifyAlertClosed()
    }

}
