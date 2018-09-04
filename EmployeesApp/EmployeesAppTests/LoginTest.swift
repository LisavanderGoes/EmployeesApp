
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

//test_(func name)_(conditions)_(results)

import Foundation
import XCTest
@testable import EmployeesApp

class LoginTest : XCTestCase{
    
    
    func test_compareInput_withCorrectUsernameAndPassword_CorrectLoginCheck(){
        let sut = makeSUT(username: "name", password: "password", loginCredentials: [
            LoginCredentials(username: "name", password: "password")])
        
        XCTAssertTrue(sut.compareInput())
    }
    
    func test_compareInput_withIncorrectUsernameAndIncorrectPassword_IncorrectLoginCheck(){
        let sut = makeSUT(username: "false_name", password: "false_password", loginCredentials: [
            LoginCredentials(username: "name", password: "password")])

        XCTAssertFalse(sut.compareInput())
    }
    
    func test_compareInput_withoutCorrectLoginCredentials_IncorrectLoginCheck() {
        let sut = makeSUT(username: "name", password: "password")

        XCTAssertFalse(sut.compareInput())
    }
    
    func test_compareInput_withMultipleCorrectLoginCredentials_OneCorrectLoginCheck() {
        let sut = makeSUT(username: "name", password: "password", loginCredentials: [
            LoginCredentials(username: "name", password: "password"),
            LoginCredentials(username: "name2", password: "password2")])
        
        
        XCTAssertTrue(sut.compareInput())
    }
    
    //test with multiple users + same name (+ same password) dubble entry
    
    
    //MARK: Helpers
    
    func makeSUT(username: String = "", password: String = "", loginCredentials : [LoginCredentials] = []) -> LoginCredentialsCheck{
        return LoginCredentialsCheck(inputLoginCredentials: LoginCredentials(username: username, password: password), correctLoginCredentials: loginCredentials)
    }
}
