//
//  ARKidsUITests.swift
//  ARKidsUITests
//
//  Created by Ivan Grebenyuk on 20.07.2020.
//  Copyright © 2020 Victor Sobolev. All rights reserved.
//

import XCTest

class ARKidsUITests: BaseClass {

   
    func testDoctorBuysProperty()  {
        let startPage = StartPage()
        let doctorProfilePage = DoctorProfile()
        let marketPage = Market()
        let bicyclePage = Bicycle()
        
        
        app.launch()
        startPage.verifyProfessionExists(.Doctor)
        startPage.openProfilePage(.Doctor)
        doctorProfilePage.openMarket()
        marketPage.buyProduct(.property)
        marketPage.productIsDisabledafterBuying(.property)
        marketPage.backToProfilePage()
        doctorProfilePage.scrollDownToVisibleElement(doctorProfilePage.propertyTitle)
        doctorProfilePage.verifyBoughtProductAdded(product: doctorProfilePage.propertyTitle)
        doctorProfilePage.openBoughtProduct()
        bicyclePage.verifyBoostButtonExists()
        bicyclePage.tapOnBoostButton()
 
                

                
            }
}
