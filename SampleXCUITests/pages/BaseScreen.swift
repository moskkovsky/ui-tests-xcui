//
//  BaseScreen.swift
//  SampleXCUITests
//
//  Created by moskovsky on 08.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

class BaseScreen {
    public let app = XCUIApplication()
    private lazy var uiElementsTab = app.tabBars.buttons["UI Elements"]
    private lazy var webViewTab = app.tabBars.buttons["Web View"]
    private lazy var localTestingTab = app.tabBars.buttons["Local Testing"]
    
    @discardableResult
    func goToUIElements() -> Self {
        uiElementsTab.tap()
        return self
    }
    
    @discardableResult
    func goToWebView() -> Self {
        webViewTab.tap()
        return self
    }
    
    @discardableResult
    func goToLocalTesting() -> Self {
        localTestingTab.tap()
        return self
    }
}
