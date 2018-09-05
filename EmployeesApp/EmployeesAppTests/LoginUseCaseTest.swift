
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class LoginUseCaseTest : XCTestCase {
    
    var loginService : LoginServiceSpy!
    
    var sut : LoginUseCase!
    
    override func setUp() {
        loginService = LoginServiceSpy()
        sut = LoginUseCase(loginService: loginService)
    }
    
    func test_loginCredentialCheck_correctUsernameAndPassword_checkHasSucceedIsTrue(){
        
        sut.loginCredentialsCheck(username: "name", password: "password")
        
        XCTAssertTrue(sut.checkHasSucceed)
    }
    
    func test_loginCredentialCheck_incorrectUsernameAndPassword_checkHasSucceedIsFalse(){
        
        sut.loginCredentialsCheck(username: "name2", password: "password2")
        
        XCTAssertFalse(sut.checkHasSucceed)
    }
}


//MARK: Helpers

class LoginServiceSpy : LoginService{
    
    func loginCredentialsCheck(username: String, password: String) -> Bool {
        
        let dataLoginCredentials : [LoginCredentials] = [LoginCredentials(username: "name", password: "password")]
        
        if !dataLoginCredentials.isEmpty{
            for loginCredentials in dataLoginCredentials{
                if (username.elementsEqual(loginCredentials.username) && password.elementsEqual(loginCredentials.password)){return true}
            }
        }
        return false
    }
}
