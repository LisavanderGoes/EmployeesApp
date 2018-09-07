
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class LoginViewControllerTest: XCTestCase {
    
    var sut: LoginViewController!
    
    override func setUp() {
        sut = LoginViewController()
        _ = sut.view
    }
    
    //MARK: viewDidLoad
    func test_viewDidLoad_usernameTextFieldIsConnected() {
        XCTAssertNotNil(sut.usernameTextField)
    }
    
    func test_viewDidLoad_passwordTextFieldIsConnected() {
        XCTAssertNotNil(sut.passwordTextField)
    }
    
    func test_viewDidLoad_messageLabelIsConnected() {
        XCTAssertNotNil(sut.messageLabel)
    }
    
    func test_viewDidLoad_loginButtonIsConnected() {
        XCTAssertNotNil(sut.loginButton)
    }
    
    func test_viewDidLoad_loadingIndicatorIsConnected() {
        XCTAssertNotNil(sut.loadingIndicator)
    }
    
    func test_viewDidLoad_loginClosureIsCalled() {
        var isLoginClosureCalled = false
        sut.loginClosure = { _, _ in
            isLoginClosureCalled = true
        }
        sut.loginButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(isLoginClosureCalled)
    }
    
    func test_viewDidLoad_hideLoadingIndicator() {
        XCTAssertTrue(sut.loadingIndicator.isHidden)
    }
    
    //MARK: loginClosure
    func test_loginClosure_loginButtonTapped_usernameIsCapturedUsername() {
        var capturedUsername: String?
        sut.loginClosure = { username, _  in
            capturedUsername = username
        }
        sut.usernameTextField.text = "name"
        sut.loginButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(capturedUsername, "name")
    }

    func test_loginClosure_loginButtonTapped_passwordIsCapturedPassword() {
        var capturedPassword: String?
        sut.loginClosure = { _, password in
            capturedPassword = password
        }
        sut.passwordTextField.text = "password"
        sut.loginButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(capturedPassword, "password")
    }
    
    func test_show_showsMessage() {
        sut.show(message: "My message")
        XCTAssertEqual(sut.messageLabel.text, "My message")
    }
    
    func test_showLoadingIndicator_showsLoadingIndicator() {
        sut.showLoadingIndicator()
        XCTAssertFalse(sut.loadingIndicator.isHidden)
    }
    
    func test_hideLoadingIndicator_hidesLoadingIndicator() {
        sut.loadingIndicator.isHidden = false
        sut.hideLoadingIndicator()
        XCTAssertTrue(sut.loadingIndicator.isHidden)
    }
    
    func test_disableLoginButton_disablesLoginButton() {
        sut.disableLoginButton()
        XCTAssertFalse(sut.loginButton.isEnabled)
    }
    
    func test_enableLoginButton_enablesLoginButton() {
        sut.loginButton.isEnabled = false
        sut.enableLoginButton()
        XCTAssertTrue(sut.loginButton.isEnabled)
    }
}
