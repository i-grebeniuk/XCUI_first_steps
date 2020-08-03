//
//  XCTest+Allure.swift
//  UITests
//
//  Created by p.levishchev on 05/03/2020.
//  Copyright © 2020 АО «Тинькофф Банк», лицензия ЦБ РФ № 2673. All rights reserved.
//
import XCTest

private extension String {
    static let allureName = "allure.name"
    static let allureLabel = "allure.label."
    static let team = "team"
    static let component = "component"
    static let epic = "epic"
    static let suite = "suite"
    static let testSuite = "testSuite"
    static let issue = "issue"
    static let story = "story"
    static let testId = "testId"
    static let package = "package"
    static let feature = "feature"
    static let severity = "severity"
    static let allureId = "AS_ID"
}

public extension XCTest {
    @discardableResult
    func team(_ value: String) -> XCTest {
        label(.team, value)
        return self
    }
    
    @discardableResult
    func component(_ value: String) -> XCTest {
        label(.component, value)
        return self
    }
    
    @discardableResult
    func epic(_ value: String) -> XCTest {
        label(.epic, value)
        return self
    }
    
    @discardableResult
    func feature(_ value: String) -> XCTest {
        label(.feature, value)
        return self
    }
    
    @discardableResult
    func story(_ value: String) -> XCTest {
        label(.story, value)
        return self
    }
    
    @discardableResult
    func suite(_ value: String) -> XCTest {
        label(.suite, value)
        return self
    }
    
    @discardableResult
    func testSuite(_ value: String) -> XCTest {
        label(.testSuite, value)
        return self
    }
    
    @discardableResult
    func issue(_ value: String) -> XCTest {
        label(.issue, value)
        return self
    }
    
    @discardableResult
    func package(_ value: String) -> XCTest {
        label(.package, value)
        return self
    }
    
    @discardableResult
    func testId(_ value: String) -> XCTest {
        label(.testId, value)
        return self
    }
    
    @discardableResult
    func allureId(_ value: String) -> XCTest {
        label(.allureId, value)
        return self
    }
    
    @discardableResult
    func severity(_ value: Severity) -> XCTest {
        label(.severity, value.rawValue)
        return self
    }

    @discardableResult
    func label(_ name: String, _ value: String) -> XCTest {
        XCTContext.runActivity(named: .allureLabel + name + ":" + value, block: {_ in})
        return self
    }
    
    @discardableResult
    func name(_ value: String) -> XCTest {
        XCTContext.runActivity(named: .allureName + ":" + value, block: {_ in})
        return self
    }
    
    @discardableResult
    func step(_ name: String, step: () -> Void) -> XCTest {
        XCTContext.runActivity(named: name) { _ in
            step()
        }
        return self
    }
}

public enum Severity: String {
    case blocker
    case critical
    case normal
    case minor
    case trivial
}
