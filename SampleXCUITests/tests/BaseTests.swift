//
//  BaseTests.swift
//  SampleXCUITests
//
//  Created by moskovsky on 08.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

class BaseTests: XCTestCase {
    private var baseScreen = BaseScreen()

    lazy var app = baseScreen.app

    open override func setUp() {
        app.launch()
        // Тест остановится при первой ошибке
        continueAfterFailure = true
    }

    open override func tearDown() {
        app.terminate()
    }
}

