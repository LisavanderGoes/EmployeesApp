
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
    
    func test_compareInput_withCorrectUsernameAndPassword_CorrectLoginCheck(){
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password")]
        
        XCTAssertTrue(sut.loginCredentialsCheck(username: "name", password: "password"))
    }
    
    func test_compareInput_withIncorrectUsernameAndIncorrectPassword_IncorrectLoginCheck(){
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password")]

        XCTAssertFalse(sut.loginCredentialsCheck(username: "false_name", password: "false_password"))
    }
    
    func test_compareInput_withoutLoginCredentialsData_IncorrectLoginCheck() {
        XCTAssertFalse(sut.loginCredentialsCheck(username: "name", password: "password"))
    }
    
    func test_compareInput_withMultipleLoginCredentialsData_OneCorrectLoginCheck() {
        
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password"),
            LoginCredentials(username: "name2", password: "password2")]
        
        
        XCTAssertTrue(sut.loginCredentialsCheck(username: "name", password: "password"))
    }
    
    func test_compareInput_withMultipleLoginCredentialsData_SameUsernamesAndDifferentPasswords_OneCorrectLoginCheck() {
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password"),
            LoginCredentials(username: "name", password: "password2")]
        
        XCTAssertTrue(sut.loginCredentialsCheck(username: "name", password: "password"))
    }
    
    func test_compareInput_withMultipleLoginCredentialsData_SamePasswordAndDifferentUsername_OneCorrectLoginCheck() {
        sut.dataLoginCredentials = [
            LoginCredentials(username: "name", password: "password"),
            LoginCredentials(username: "name2", password: "password")]
        
        XCTAssertTrue(sut.loginCredentialsCheck(username: "name", password: "password"))
    }
    
    
    //MARK: Helpers
   
}
