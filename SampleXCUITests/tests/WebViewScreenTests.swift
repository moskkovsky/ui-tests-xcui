//
//  WebViewScreen.swift
//  SampleXCUITests
//
//  Created by moskovsky on 08.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import Foundation

final class WebViewScreenTests: BaseTests {
    
    override func setUp() {
        super.setUp()
        BaseScreen()
            .goToWebView()
        WebViewScreen()
            .baseElement
            .verifyExistence(message: ErrorMessageValue.loadWebViewScreen)
    }
    
    func testScrollToTextBenefits() {
        WebViewScreen()
            .verifyBenefitsSectionVisible()
    }
    
    // Поиск по началу текста
    func testShouldFindTextByPrefix() {
        WebViewScreen()
            .shouldFindTextByPrefix()
    }
    
    // Поиск с игнорированием регистра
    func testShouldFindTextCaseInsensitive() {
        WebViewScreen()
            .shouldFindTextCaseInsensitive()
    }
    
    // Поиск по ключевым словам
    func testShouldFindTextByMultipleKeywords() {
        WebViewScreen()
            .shouldFindTextByMultipleKeywords(["users", "seamless"])
    }
}
