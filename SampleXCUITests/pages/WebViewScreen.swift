//
//  WebViewScreen.swift
//  SampleXCUITests
//
//  Created by moskovsky on 08.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import Foundation
import XCTest

final class WebViewScreen: BaseScreen {
    private lazy var titleLabel = app.webViews.staticTexts["App & Browser Testing Made Easy"]
    private lazy var benefitsSection = app.webViews.staticTexts["Benefits"]
    
    lazy var baseElement = titleLabel
    
    @discardableResult
    func verifyBenefitsSectionVisible() -> Self{
        benefitsSection.scrollToView()
        return self
    }
    
    @discardableResult
    func shouldFindTextByPrefix() -> Self{
        let beginText = app.webViews.staticTexts.containing(NSPredicate(format: "label BEGINSWITH %@", "Give your")).firstMatch
        beginText.verifyExistence()
        return self
    }
    
    @discardableResult
    func shouldFindTextCaseInsensitive() -> Self {
        let containsText = app.webViews.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] %@", "give your")).firstMatch
        containsText.verifyExistence()
        return self
    }
    
    @discardableResult
    func shouldFindTextByMultipleKeywords(_ keywords: [String]) -> Self{
        let keyText = app.webViews.staticTexts.containing(NSPredicate(format:                        "label CONTAINS %@ AND label CONTAINS %@",
        keywords[0], keywords[1])).firstMatch
        keyText.verifyExistence()
        return self
    }
}
