//
//  Verifications.swift
//  SampleXCUITests
//
//  Created by moskovsky on 09.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    @discardableResult
    func verifyExistence(timeout: TimeInterval = 3, message: String = "") -> Self {
        let errorMessage = message.isEmpty ? "Элемент '\(self)' должен существовать" : message
        XCTAssertTrue(
            self.waitForExistence(timeout: timeout),
            errorMessage
        )
        return self
    }
    
    @discardableResult
    func verifyHittable(message: String = "") -> Self {
        let errorMessage = message.isEmpty ? "Элемент '\(self)' должен быть доступен для взаимодействия" : message
        XCTAssertTrue(
            self.isHittable,
            errorMessage
        )
        return self
    }
    
    @discardableResult
    func verifyDisappear(timeout: TimeInterval = 3, message: String = "") -> Self {
        let errorMessage = message.isEmpty ? "Элемент '\(self)' должен исчезнуть" : message
        XCTAssertFalse(
            self.waitForExistence(timeout: timeout),
            errorMessage
        )
        return self
    }
    
    @discardableResult
    func verifyAndTap(timeout: TimeInterval = 3, message: String = "") -> Self {
        self.verifyExistence(timeout: timeout, message: message)
            .verifyHittable(message: message)
            .tap()
        return self
    }
    
    @discardableResult
    func verifyLabel(expected: String, message: String = "") -> Self {
        let errorMessage = message.isEmpty ?
        "Текст элемента '\(self)' не соответствует. Актуальный: '\(self.label)', Ожидаемый: '\(expected)'" :
        message
        XCTAssertEqual(self.label, expected, errorMessage)
        return self
    }
    
    
    @discardableResult
    func typeTextSafely(_ text: String, message: String = "") -> Self {
        self.verifyExistence(message: message)
            .verifyHittable(message: message)
            .tap()
        self.typeText(text)
        XCUIApplication().keyboards.buttons["Return"].tap()
        return self
    }
    
    @discardableResult
    func scrollToView(maxAttempts: Int = 10) -> Self {
        for _ in 1...maxAttempts {
            if self.isHittable {
                return self
            }
            sleep(2)
            XCUIApplication().webViews.firstMatch.swipeUp()
        }
        XCTFail("Элемент \(self) отсутствует на экране")
        return self
    }
}
