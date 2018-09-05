
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class LoginUseCaseTest : XCTestCase {
    
    var loginCredentialsCheck : LoginCredentialsCheck!
    
    var sut : LoginUseCase!
    
    override func setUp() {
        loginCredentialsCheck = LoginCredentialsCheck()
        sut = LoginUseCase(loginService: loginCredentialsCheck)
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
