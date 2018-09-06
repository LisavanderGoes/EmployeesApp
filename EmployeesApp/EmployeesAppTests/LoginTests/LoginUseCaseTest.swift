
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
    
    func test_loginService_couldGetUsernameAndPassword(){
        
        sut.loginCredentialsCheck(username: "name", password: "password")
        
        XCTAssertEqual(loginService.capturedUsername, "name")
        XCTAssertEqual(loginService.capturedPassword, "password")
    }
    
    func test_loginUseCaseOutput_correctLogin(){
        
        loginService.succeeds = 1

        sut.loginCredentialsCheck(username: "name", password: "password")

        XCTAssertTrue(loginUseCaseOutput.capturedSucces)
    }
    
    func test_loginUseCaseOutput_incorrectLogin(){
        
        loginService.succeeds = 0
        
        sut.loginCredentialsCheck(username: "name", password: "password")
        
        XCTAssertFalse(loginUseCaseOutput.capturedSucces)
    }
    
    func test_loginUseCaseOutput_couldGetFailMessage(){
        
        loginService.setFailReason = "My bad!"
        loginService.succeeds = 0
        
        sut.loginCredentialsCheck(username: "name", password: "password")
        
        XCTAssertEqual(loginUseCaseOutput.capturedFailReason, "My bad!")
    }
}


//MARK: Helpers

class LoginServiceSpy : LoginService{
    
    var capturedUsername : String!
    var capturedPassword : String!
    
    var setFailReason : String = ""
    var succeeds = 0
    
    func loginCredentialsCheck(username: String, password: String, succeed: () -> Void, failed: (String) -> Void) {
        capturedUsername = username
        capturedPassword = password
        
        if self.succeeds > 0 {succeed()}else{failed(setFailReason)}
    }
}

class LoginUseCaseOutputSpy : LoginUseCaseOutput {
    
    var capturedFailReason : String!
    var capturedSucces : Bool!
    
    func checkHasSucceed() {
        capturedSucces = true
    }
    
    func checkHasFailed(reason: String) {
        capturedFailReason = reason
        capturedSucces = false

    }
}
