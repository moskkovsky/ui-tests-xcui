//
//  HomeScreenTests.swift
//  SampleXCUITests
//
//  Created by moskovsky on 08.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

final class HomeScreenTests: BaseTests {
    
    override func setUp() {
        super.setUp()
        HomeScreen().baseElement.verifyExistence(
            message: ErrorMessageValue.loadMainScreen
        )
    }
    
    func testAlertShouldAppearAfterButtonTap() {
        HomeScreen()
            .tapAlert()
    }
    
    func testAlertShouldDisappearAfterTappingOK() {
        HomeScreen()
            .tapAlert()
            .closeAlert()
    }
    
    func testTextInputShouldDisplayCorrectly() {
        HomeScreen()
            .tapText()
            .enterText(HomeScreenValue.textFieldInput)
            .checkTextAfterPushTextField(HomeScreenValue.textFieldInput)
    }
    
    func testCheckVisibleTextWhileSwitchingBetweenScreens() {
        HomeScreen()
            .tapText()
            .enterText(HomeScreenValue.textFieldInput)
        BaseScreen()
            .goToWebView()
            .goToUIElements()
        HomeScreen()
            .checkTextAfterPushTextField(HomeScreenValue.textFieldInput)
    }
}
