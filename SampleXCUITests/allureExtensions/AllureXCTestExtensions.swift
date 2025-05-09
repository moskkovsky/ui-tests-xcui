//
//  AllureXCTestExtensions.swift
//  SampleXCUITests
//
//  Created by moskovsky on 09.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

extension XCTest {
    func epic(_ values:String...) {
        label(name: "epic", values: values)
    }
    
    func feature(_ values:String...) {
        label(name: "feature", values: values)
    }
    
    func story(_ values: String...) {
        label(name: "story", values: values)
    }
    
    func displayName(_ name: String) {
        addTestCaseName(value: name)
    }
    
    func severity(_ values: String...) {
        label(name: "severity", values: values)
    }
    
    func owner(_ values: String...) {
        label(name: "owner", values: values)
    }
    
    func step(_ name: String, step: () -> Void) {
        XCTContext.runActivity(named: name) { _ in
            step()
        }
    }
    
    private func label(name: String, values: [String]) {
        for value in values {
            XCTContext.runActivity(named: "allure.label.\(name):\(value)", block: { _ in })
        }
    }
    
    private func addTestCaseName(value: String) {
        XCTContext.runActivity(named: "allure.name:\(value)") { _ in }
    }
}
