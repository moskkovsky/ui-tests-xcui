//
//  HomeScreen.swift
//  SampleXCUITests
//
//  Created by moskovsky on 08.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

final class HomeScreen: BaseScreen {
    private lazy var titleLabel = app.navigationBars.staticTexts["UI Elements"]
    private lazy var buttonText = app.buttons["Text"]
    private lazy var alertButton = app.buttons["Alert"]
    private lazy var alertText = app.alerts.element.staticTexts["Дуров верни стену"]
    private lazy var alertOKButton = app.alerts.element.buttons["😔"]
    private lazy var buttonBack = app.navigationBars.buttons["UI Elements"]
    private lazy var textField = app.textFields["Enter a text"]
    private lazy var resultLabel = app.staticTexts[HomeScreenValue.textFieldInput]
    
    lazy var baseElement = titleLabel
    
    @discardableResult
    func tapText() -> Self {
        buttonText
            .verifyExistence()
            .verifyHittable()
            .tap()
        
        textField.verifyExistence()
        return self
    }
    
    @discardableResult
    func tapAlert() -> Self {
        alertButton
            .verifyExistence()
            .verifyHittable()
            .tap()
        
        alertText
            .verifyExistence()
        return self
    }
    
    @discardableResult
    func closeAlert() -> Self {
        alertOKButton
            .verifyExistence()
            .verifyHittable()
            .tap()
        
        alertOKButton.verifyDisappear()
        return self
    }
    
    @discardableResult
    func enterText(_ inputMessage: String) -> Self {
        textField.typeTextSafely(inputMessage)
        return self
    }
    
    @discardableResult
    func checkTextAfterPushTextField(_ expectedText: String) -> Self {
        resultLabel.verifyLabel(expected: expectedText)
        return self
    }
}

