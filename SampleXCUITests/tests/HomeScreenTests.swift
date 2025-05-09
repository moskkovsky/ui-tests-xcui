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
        step("Проверяем корректную загрузку главного экрана приложения") {
            HomeScreen().baseElement.verifyExistence(
                message: ErrorMessageValue.loadMainScreen
            )
        }
    }
    
    // MARK: - Alert
    func testAlertShouldAppearAfterButtonTap() {
        epic("Главный экран")
        feature("Взаимодействие с Alert")
        story("Открытие Alert")
        displayName("Открытие Alert при нажатии на кнопку")
        severity("MINOR")
        owner("Anton Moskovsky")
        
        step("Тап на кнопку Alert и проверка появления алерта") {
            HomeScreen()
                .tapAlert()
        }
        
    }
    
    func testAlertShouldDisappearAfterTappingOK() {
        epic("Главный экран")
        feature("Взаимодействие с Alert")
        story("Закрытие Alert")
        displayName("Закрытие Alert после нажатия на кнопку 'OK'")
        severity("MINOR")
        owner("Anton Moskovsky")
        
        step("Тап на кнопку Alert и проверка появления алерта") {
            HomeScreen().tapAlert()
        }
        
        step("Нажимаем кнопку 'OK' в Alert и проверяем его исчезновение") {
            HomeScreen().closeAlert()
        }
    }
    
    // MARK: - Ввод символов
    func testTextInputShouldDisplayCorrectly() {
        epic("Главный экран")
        feature("Взаимодействие с текстовым полем")
        story("Ввод и проверка текста")
        displayName("Корректное отображение введенного текста")
        severity("MINOR")
        owner("Anton Moskovsky")
        
        step("Переходим на экран ввода текста через кнопку 'Text'") {
            HomeScreen().tapText()
        }
        
        step("Вводим текст '\(HomeScreenValue.textFieldInput)' в текстовое поле") {
            HomeScreen()
                .enterText(HomeScreenValue.textFieldInput)
        }
        
        step("Проверяем, что введенный текст корректно отображается над полем ввода") {
            HomeScreen().checkTextAfterPushTextField(HomeScreenValue.textFieldInput)
        }
    }
    
    func testCheckVisibleTextWhileSwitchingBetweenScreens() {
        epic("Главный экран")
        feature("Взаимодействие с текстовым полем")
        story("Сохранение текста между экранами")
        displayName("Сохранение текста при переключении экранов")
        severity("NORMAL")
        owner("Anton Moskovsky")
        
        step("Переходим на экран ввода текста через кнопку 'Text'") {
            HomeScreen().tapText()
        }
        
        step("Вводим текст '\(HomeScreenValue.textFieldInput)' в текстовое поле") {
            HomeScreen()
                .enterText(HomeScreenValue.textFieldInput)
        }
        
        step("Переход на WebView и обратно на главный экран") {
            BaseScreen()
                .goToWebView()
                .goToUIElements()
        }
        
        step("Проверяем, что введенный текст сохранился после возврата на главный экран") {
            HomeScreen()
                .checkTextAfterPushTextField(HomeScreenValue.textFieldInput)
        }
    }
}
