//
//  StartPage.swift
//  ARKidsUITests
//
//  Created by Ivan Grebenyuk on 21.07.2020.
//  Copyright © 2020 Victor Sobolev. All rights reserved.
//
import XCTest


class StartPage: BaseClass {
    
    lazy var professionsTitle = app.staticTexts["Professions"]
    
    enum Profession: String {
        case Gardener
        case Mechanic
        case Doctor
    }
    func openProfilePage(_ professionTitle: Profession){
        app.staticTexts[professionTitle.rawValue].tap()
    }
    
    func verifyProfessionExists(_ profession: Profession) {
        XCTAssert(app.staticTexts[profession.rawValue].exists,
                  "\(profession.rawValue) is not exist on Start screen, but it should be!")
        
    }
}
