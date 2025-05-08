//
//  SampleXCUITests.swift
//  SampleXCUITests
//
//  Created by moskovsky on 06.05.2025.
//  Copyright © 2025 BrowserStack. All rights reserved.
//

import XCTest

final class SampleXCUITests: XCTestCase {
    private let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
    func testAlertShouldAppearAfterButtonTap() {
        let alertButton = app.buttons["Alert"]
        XCTAssertTrue(alertButton.waitForExistence(timeout: 3),
                      "Кнопка 'Alert' не найдена на экране")
        alertButton.tap()
        
        let alert = app.alerts.element.staticTexts["Alert"]
        XCTAssertTrue(alert.waitForExistence(timeout: 3),
                      "Alert не появился после нажатия кнопки")
    }
    
    func testAlertShouldDisappearAfterTappingOK() {
        let alertButton = app.buttons["Alert"]
        XCTAssertTrue(alertButton.waitForExistence(timeout: 3),
                      "Кнопка 'Alert' не найдена на экране")
        alertButton.tap()
        
        let alert = app.alerts.element.staticTexts["Alert"]
        XCTAssertTrue(alert.waitForExistence(timeout: 3),
                      "Alert не появился после нажатия кнопки")
        
        let alertButtonOK = app.alerts.element.buttons["OK"]
        alertButtonOK.tap()
        
        XCTAssertFalse(alert.waitForExistence(timeout: 3),
                       "Alert должен исчезнуть после нажатия OK")
    }
    
    func testTextInputShouldDisplayCorrectly() {
        let textButton = app.buttons["Text"]
        XCTAssertTrue(textButton.waitForExistence(timeout: 3),
                      "Кнопка 'Text' не найдена на экране")
        textButton.tap()
        
        let textField = app.textFields["Enter a text"]
        let displayedText = app.staticTexts["VK"]
        XCTAssertTrue(textField.waitForExistence(timeout: 3),
                      "Поле ввода должно отображаться после нажатия кнопки")
        textField.tap()
        textField.typeText("VK")
        app.keyboards.buttons["Return"].tap()
        if displayedText.isHittable {
            XCTContext.runActivity(named: "Проверка отображения введённого текста") { _ in
                XCTAssertTrue(displayedText.waitForExistence(timeout: 3),
                              "Текст 'VK' должен появиться на экране")
                XCTAssertEqual(displayedText.label, "VK",
                               "Отображаемый текст должен точно соответствовать введенному")
            }
        }
    }
    
    func testCheckVisibleTextWhileSwitchingBetweenScreens() {
        let textButton = app.buttons["Text"]
        XCTAssertTrue(textButton.waitForExistence(timeout: 3),
                      "Кнопка 'Text' не найдена на экране")
        textButton.tap()
        
        let textField = app.textFields["Enter a text"]
        let displayedText = app.staticTexts["VK"]
        XCTAssertTrue(textField.waitForExistence(timeout: 3),
                      "Поле ввода должно отображаться после нажатия кнопки")
        textField.tap()
        textField.typeText("VK")
        app.keyboards.buttons["Return"].tap()
        if displayedText.isEnabled {
            XCTContext.runActivity(named: "Проверка отображения введённого текста") { _ in
                XCTAssertTrue(displayedText.waitForExistence(timeout: 3),
                              "Текст 'VK' должен появиться на экране")
                XCTAssertEqual(displayedText.label, "VK",
                               "Отображаемый текст должен точно соответствовать введенному")
            }
        }
        XCTContext.runActivity(named: "Проверка сохранения текста после перехода на WebView") { _ in
            app.tabBars.buttons["Web View"].tap()
            app.tabBars.buttons["UI Elements"].tap()
            
            XCTAssertTrue(displayedText.waitForExistence(timeout: 3),
                          "Текст должен сохраняться при возврате на экран")
            XCTAssertEqual(displayedText.label, "VK",
                           "Текст не должен изменяться при переключении экранов")
        }
    }
    
    // Поиск по началу текста
    func testShouldFindTextByPrefix() {
        app.tabBars.buttons["Web View"].tap()
        let beginText = app.webViews.staticTexts.containing(NSPredicate(format: "label BEGINSWITH %@", "Give your")).firstMatch
        XCTAssertTrue(beginText.waitForExistence(timeout: 5),
                      "Не найден текст по началу символов")
    }
    
    // Поиск с игнорированием регистра
    func testShouldFindTextCaseInsensitive() {
        app.tabBars.buttons["Web View"].tap()
        let containsText = app.webViews.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] %@", "give your")).firstMatch
        XCTAssertTrue(containsText.waitForExistence(timeout: 5),
                      "Не найден текст с игнорированием регистра")
        
    }
    
    // Поиск по ключевым словам
    func testShouldFindTextByMultipleKeywords() {
        app.tabBars.buttons["Web View"].tap()
        let keywords = ["users", "seamless"]
        let keyText = app.webViews.staticTexts.containing(NSPredicate(format:                   "label CONTAINS %@ AND label CONTAINS %@",
                                                                      keywords[0], keywords[1])).firstMatch
        XCTAssertTrue(keyText.waitForExistence(timeout: 5),
                      "Не найден текст по ключевым словам")
        
    }
    func testScrollToTextBenefits() {
        app.tabBars.buttons["Web View"].tap()
        let scrollText = app.webViews.staticTexts["Benefits"]
        // Скроллим, пока элемент не появится на экране
        for _ in 1...10 {
            if scrollText.isHittable {
                return
            }
            sleep(3)
            app.webViews.firstMatch.swipeUp()
        }
        XCTFail("Текст 'Benefits' не найден после 15 скроллов")
    }
}
