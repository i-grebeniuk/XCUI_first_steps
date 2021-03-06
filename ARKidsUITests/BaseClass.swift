//
//  BaseClass.swift
//  ARKidsUITests
//
//  Created by Ivan Grebenyuk on 20.07.2020.
//  Copyright © 2020 Victor Sobolev. All rights reserved.
//

import XCTest

class BaseClass: XCTestCase {
    
    let app = XCUIApplication()
    
    func getPrice(_ element: XCUIElement) -> Int {
          element.waitForExistence(timeout: 1)
          let arrayOfString = element.label.components(separatedBy: " ")
          let price = Int(arrayOfString[0])
          return price!
      }
    
    func scrollDownToVisibleElement(_ element :XCUIElement){
        var counter: Int = 0
        while counter < 5 {
            if !element.exists {
                app.swipeUp()
            } else {
                break
            }
            counter += 1
        }
    }
    
    func scrollUpToVisibleElement(_ element :XCUIElement){
        var counter: Int = 0
        while counter < 5 {
            if !element.exists {
                app.swipeDown()
            } else {
                break
            }
            counter += 1
        }
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
