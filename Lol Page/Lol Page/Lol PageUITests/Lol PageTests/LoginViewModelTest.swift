//
//  LoginViewModelTest.swift
//  Lol PageTests
//
//  Created by Tony Lieu on 11/9/23.
//

import XCTest
@testable import Lol_Page
final class LoginViewModelTest: XCTestCase {
    var LoginView:LoginViewModel!
    override func setUpWithError() throws {
       //will always run when test case runs
        LoginView = Lol_Page.LoginViewModel()
    }

    override func tearDownWithError() throws {
        //clean up the test
        LoginView = nil
    }

    func testDoLoginValidation_WhenWeAreExpectingGoodResults() throws {
       let results = LoginView.loginVal(emailID: "abc@gmail.com", passwordinput: "1234665")
        print(results)
        XCTAssertTrue(results)//this is the test functionallity
        //false test results
        //let results = LoginView.loginVal(emailID: "abcgmail.com", passwordinput: "1234665")
        //XCTAssertFalse(results) //red green approch
    }
    func testDoLoginValidation_WhenWeAreExpectingFalseResults_whenEmailIsNil() throws {
       let results = LoginView.loginVal(emailID: nil, passwordinput: "1238292")
        print(results)
        XCTAssertFalse(results)//this is the test functionallity
        //false test results
        //let results = LoginView.loginVal(emailID: "abcgmail.com", passwordinput: "1234665")
        //XCTAssertFalse(results) //red green approch
    }
    func testDoLoginValidation_WhenWeAreExpectingFalseResults_whenBothIsNil() throws {
       let results = LoginView.loginVal(emailID: nil, passwordinput: nil)
        print(results)
        XCTAssertFalse(results)//this is the test functionallity
        //false test results
        //let results = LoginView.loginVal(emailID: "abcgmail.com", passwordinput: "1234665")
        //XCTAssertFalse(results) //red green approch
    }
    func testDoLoginValidation_WhenWeAreExpectingFalseResults_whenBothIsEmpty() throws {
       let results = LoginView.loginVal(emailID: "", passwordinput: "")
        print(results)
        XCTAssertFalse(results)//this is the test functionallity
        //false test results
        //let results = LoginView.loginVal(emailID: "abcgmail.com", passwordinput: "1234665")
        //XCTAssertFalse(results) //red green approch
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
