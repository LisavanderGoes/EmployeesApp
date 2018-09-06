
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//


import Foundation
import XCTest
@testable import EmployeesApp

class LoginCredentialsCheckTest : XCTestCase{
    
    var sut : LoginCredentialsCheck!
    
    override func setUp() {
        sut = LoginCredentialsCheck()
    }
    
    //MARK: Tests
    
    func test_compareInput_withCorrectUsernameAndPassword_CorrectLoginCheck(){
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password")]
        
        makeLoginCredentialsCheck()
        
        XCTAssertTrue(capturedSucceeds > 0)
    }
    
    func test_compareInput_failedMessage_withIncorrectUsernameAndIncorrectPassword_IncorrectLoginCheck(){
        sut.dataLoginCredentials = [
            LoginCredentials(username: "correct_name", password: "correct_password")]

        makeLoginCredentialsCheck()

        XCTAssertEqual(capturedMessage, "Something does not match!")
        XCTAssertEqual(capturedSucceeds, 0)
    }

    func test_compareInput_failedMessage_withoutLoginCredentialsData_IncorrectLoginCheck() {
        sut.dataLoginCredentials = []
        
        makeLoginCredentialsCheck()
        
        XCTAssertEqual(capturedMessage, "There are no users! Are you the first?")
        XCTAssertEqual(capturedSucceeds, 0)
    }

    func test_compareInput_withMultipleLoginCredentialsData_SameUsernamesAndDifferentPasswords_OneCorrectLoginCheck() {
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password"),
            LoginCredentials(username: "name", password: "password2")]
        
        makeLoginCredentialsCheck()
        
        XCTAssertEqual(capturedSucceeds, 1)
    }

    func test_compareInput_withMultipleLoginCredentialsData_SamePasswordAndDifferentUsername_OneCorrectLoginCheck() {
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password"),
            LoginCredentials(username: "name2", password: "password")]
        
        makeLoginCredentialsCheck()
        
        XCTAssertEqual(capturedSucceeds, 1)
    }
    
    func test_compareInput_withMultipleIncorrectUsernameAndIncorrectPassword_SucceedsCountShouldBeZero(){
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name2", password: "password"), LoginCredentials(username: "name2", password: "password")]
        
        makeLoginCredentialsCheck()
        
        XCTAssertEqual(capturedSucceeds, 0)
    }
    
    func test_compareInput_withMultipleCorrectUsernameAndCorrectPassword_SucceedsCountShouldBeOne(){
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password"), LoginCredentials(username: "name", password: "password")]
        
        makeLoginCredentialsCheck()
        
        XCTAssertTrue(capturedSucceeds < 2)
    }
    
    
    //MARK: Helpers
    
    var capturedSucceeds : Int!
    var capturedMessage : String!
    
    func succeed(){
        capturedSucceeds = capturedSucceeds + 1
        print("MARK: Succes")
    }
    
    func failed(reason: String){
        capturedMessage = reason
        print("MARK: Fail")
    }
    
    func makeLoginCredentialsCheck(){
        capturedSucceeds = 0
        capturedMessage = ""
        
        sut.loginCredentialsCheck(
            username: "name",
            password: "password",
            succeed: succeed,
            failed: {reason in failed(reason: reason)})
    }
   
}
