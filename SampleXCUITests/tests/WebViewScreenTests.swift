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
        step("Переходим на экран WebView из главного меню") {
            BaseScreen()
                .goToWebView()
        }
        step("Проверяем корректную загрузку экрана WebView") {
            WebViewScreen()
                .baseElement
                .verifyExistence(message: ErrorMessageValue.loadWebViewScreen)
        }
    }
    
    func testScrollToTextBenefits() {
        epic("Экран WebView")
        feature("Поиск текста")
        story("Нахождение текста с помощью ScrollView")
        displayName("Поиск текста с помощью скролл")
        severity("MINOR")
        owner("Anton Moskovsky")
        step("Выполняем скролл до раздела Benefits") {
            WebViewScreen()
                .verifyBenefitsSectionVisible()
        }
    }
    
    // Поиск по началу текста
    func testShouldFindTextByPrefix() {
        epic("Экран WebView")
        feature("Поиск текста")
        story("Поиск по началу текста")
        displayName("Поиск текста по префиксу")
        severity("MINOR")
        owner("Anton Moskovsky")
        
        step("Ищем текст по начальным символам") {
            WebViewScreen()
                .shouldFindTextByPrefix()
        }
    }
    
    // Поиск с игнорированием регистра
    func testShouldFindTextCaseInsensitive() {
        epic("Экран WebView")
        feature("Поиск текста")
        story("Поиск с игнорированием регистра")
        displayName("Поиск текста без учета регистра")
        severity("MINOR")
        owner("Anton Moskovsky")
        
        step("Ищем текст, игнорируя регистр символов") {
            WebViewScreen()
                .shouldFindTextCaseInsensitive()
        }
    }
    
    // Поиск по ключевым словам
    func testShouldFindTextByMultipleKeywords() {
        epic("Экран WebView")
        feature("Поиск текста")
        story("Поиск по ключевым словам")
        displayName("Поиск текста по нескольким ключевым словам")
        severity("MINOR")
        owner("Anton Moskovsky")
        
        step("Ищем текст по ключевым словам") {
            WebViewScreen()
                .shouldFindTextByMultipleKeywords(["users", "seamless"])
        }
    }
}
