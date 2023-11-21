//
//  LoginScreenUITest.swift
//  FirstSwiftUIAppTests
//
//  Created by Tony Lieu on 11/21/23.
//

import XCTest
import FirstSwiftUIApp
final class LoginScreenUITest: XCTestCase {
    private var app: XCUIApplication!
    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testScreenTitle() throws {
        XCTAssertTrue(app.staticTexts["welcome to DigiPokemon"].exists)
    }
    func testLogin() throws{
        let email = app.textFields["emailID"]
        XCTAssertTrue(email.exists)
        
        let password = app.textFields["password"]
        XCTAssertTrue(password.exists)
        
        email.tap()
        email.typeText("abc@gmail.com")
        
        password.tap()
        password.typeText("1234456")
        
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        XCTAssertTrue(loginButton.isEnabled)
    }
    func testCollectionView(){
        let collButton = app.buttons["Collection"]
        XCTAssert(collButton.exists)
        collButton.tap()
        
        let animeName = app.buttons["naruto"]
        XCTAssertTrue(animeName.waitForExistence(timeout: 5.0))
    }
    func testGenrateTabBarFlow(){
        let app = XCUIApplication()
        app.textFields["Email"].tap()
        let passwordS = app.secureTextFields["Password"]
        passwordS.tap()
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
