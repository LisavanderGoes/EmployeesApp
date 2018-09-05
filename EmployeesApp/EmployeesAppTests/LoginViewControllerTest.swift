
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class LoginViewControllerTest : XCTestCase{
    
    var sut: LoginViewController!
    
    override func setUp() {
        sut = LoginViewController()
        _ = sut.view
    }
    
    func test_viewDidLoad_() {
        XCTAssertTrue(sut.isViewLoaded)
    }
    
    func test_viewDidLoad_usernameTextFieldIsConnected(){
        XCTAssertNotNil(sut.usernameTextField)
    }
    
    func test_viewDidLoad_passwordTextFieldIsConnected(){
        XCTAssertNotNil(sut.passwordTextField)
    }
    
    func test_viewDidLoad_loginButtonIsConnected(){
        XCTAssertNotNil(sut.loginButton)
    }
    
    func test_viewDidLoad_loginClosureIsCalled(){
        var isLoginClosureCalled = false
        
        sut.loginClosure = { (_, _) in
            isLoginClosureCalled = true
        }
        
        sut.loginButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(isLoginClosureCalled)
    }
    
    func test_loginClosure_loginClosureIsCalled_usernameIsCapturedUsername(){
        var capturedUsername : String!

        sut.loginClosure = { (username, _ ) in
            capturedUsername = username
        }

        let expectedUsername = "name"
        sut.usernameTextField.text = expectedUsername

        sut.loginButton.sendActions(for: .touchUpInside)

        XCTAssertEqual(capturedUsername, "name")
    }

    func test_loginClosure_loginClosureIsCalled_passwordIsCapturedPassword(){
        var capturedPassword : String!

        sut.loginClosure = { (_, password ) in
            capturedPassword = password
        }

        let expectedPassword = "password"
        sut.passwordTextField.text = expectedPassword

        sut.loginButton.sendActions(for: .touchUpInside)

        XCTAssertEqual(capturedPassword, "password")
    }


    
}
