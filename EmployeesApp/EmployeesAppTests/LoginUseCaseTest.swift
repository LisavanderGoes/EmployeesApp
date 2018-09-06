
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class LoginUseCaseTest : XCTestCase {
    
    var loginService : LoginServiceSpy!
    var loginUseCaseOutput : LoginUseCaseOutputSpy!
    
    var sut : LoginUseCase!
    
    override func setUp() {
        loginService = LoginServiceSpy()
        loginUseCaseOutput = LoginUseCaseOutputSpy()
        
        sut = LoginUseCase(loginService: loginService, loginUseCaseOutput : loginUseCaseOutput)
    }
    
    
    //MARK: Tests
    
    func test_loginCredentialCheck_couldGetUsernameAndPassword(){
        
        loginService.dataLoginCredentials = [LoginCredentials(username: "name", password: "password")]
        sut.loginCredentialsCheck(username: "name", password: "password")
        
        XCTAssertEqual(loginService.capturedUsername, "name")
        XCTAssertEqual(loginService.capturedPassword, "password")

    }
    
//    func test_loginCredentialsCheckFailed_couldSetFailMessage(){
//        
//        loginService.setFailReason = "My bad!"
//        loginService.dataLoginCredentials = [LoginCredentials(username: "name", password: "password")]
//        sut.loginCredentialsCheck(username: "name", password: "password")
//        
//        XCTAssertEqual(loginUseCaseOutput.capturedFailReason, "My bad!")
//    }
    
    func test_loginCredentialCheck_correctUsernameAndPassword_(){

        loginService.dataLoginCredentials = [LoginCredentials(username: "name", password: "password")]
        sut.loginCredentialsCheck(username: "name", password: "password")

        XCTAssertTrue(loginUseCaseOutput.capturedSucces)
    }

    func test_loginCredentialCheck_incorrectUsernameAndPassword_(){
        
        loginService.dataLoginCredentials = [LoginCredentials(username: "name", password: "password")]
        sut.loginCredentialsCheck(username: "name2", password: "password2")
        
        XCTAssertFalse(loginUseCaseOutput.capturedSucces)
    }
    
}


//MARK: Helpers

class LoginServiceSpy : LoginService{
    
    var capturedUsername : String = ""
    var capturedPassword : String = ""
    
    var setFailReason : String = ""
    var dataLoginCredentials : [LoginCredentials]!
    
    func loginCredentialsCheck(username: String, password: String, succeed: () -> Void, failed: (String) -> Void) {
        capturedUsername = username
        capturedPassword = password
        
        
        if !dataLoginCredentials.isEmpty{
            for loginCredentials in dataLoginCredentials{
                if (username.elementsEqual(loginCredentials.username) && password.elementsEqual(loginCredentials.password)){succeed()}
            }
        } else {
            failed(setFailReason)
        }
    }
}

class LoginUseCaseOutputSpy : LoginUseCaseOutput {
    
    var capturedFailReason : String!
    
    var capturedSucces : Bool = false
    
    func checkHasSucceed() {
        capturedSucces = true
    }
    
    func checkHasFailed(reason: String) {
        capturedFailReason = reason
    }
}
