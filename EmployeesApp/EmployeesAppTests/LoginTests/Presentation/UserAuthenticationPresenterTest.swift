
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class UserAuthenticationPresenterTest : XCTestCase{
    
    var authenticationView: AuthenticationViewSpy!
    var sut: UserAuthenticationPresenter!
    
    override func setUp() {
        authenticationView = AuthenticationViewSpy()
        sut = UserAuthenticationPresenter(loginView: authenticationView)
    }
    
    // MARK: authenticationSucceded related
    func test_authenticationSucceded_showsMessageOnView() {
        sut.authenticationSucceded()
        XCTAssertTrue(authenticationView.showIsCalled)
    }
    
    func test_authenticationSucceded_showsCorrectMessageOnView() {
        sut.authenticationSucceded()
        XCTAssertEqual(authenticationView.capturedMessage, "Succes")
    }
    
    func test_authenticationSucceded_hideLoadingIndicator() {
        sut.authenticationSucceded()
        XCTAssertTrue(authenticationView.hideLoadingIndicatorIsCalled)
    }

    // MARK: authenticationFailed related
    func test_authenticationFailed_showsMessageOnView() {
        authenticationFailed()
        XCTAssertTrue(authenticationView.showIsCalled)
    }
    
    func test_authenticationFailed_showsCorrectMessageOnView() {
        let failReason = "You failed!"
        authenticationFailed(reason: failReason)
        XCTAssertEqual(authenticationView.capturedMessage, failReason)
    }
    
    func test_authenticationFailed_hideLoadingIndicator() {
        authenticationFailed()
        XCTAssertTrue(authenticationView.hideLoadingIndicatorIsCalled)
    }
    
    // MARK: authenticationStarted related
    func test_authenticationStarted_showLoadingIndicator() {
        sut.authenticationStarted()
        XCTAssertTrue(authenticationView.showLoadingIndicatorIsCalled)
    }
    
    func test_authenticationStarted_disableLoginButton() {
        sut.authenticationStarted()
        XCTAssertTrue(authenticationView.disableLoginButtonIsCalled)
    }
    
    // MARK: Helpers
    func authenticationFailed(reason: String = "") {
        sut.authenticationFailed(reason: reason)
    }
}

class AuthenticationViewSpy: AuthenticationView {
    var capturedMessage: String!
    var showIsCalled: Bool = false
    
    func show(message: String) {
        showIsCalled = true
        capturedMessage = message
    }
    
    var showLoadingIndicatorIsCalled = false
    
    func showLoadingIndicator() {
        showLoadingIndicatorIsCalled = true
    }
    
    var hideLoadingIndicatorIsCalled: Bool = false

    func hideLoadingIndicator() {
        hideLoadingIndicatorIsCalled = true
    }
    
    var disableLoginButtonIsCalled = false
    
    func disableLoginButton() {
        disableLoginButtonIsCalled = true
    }
}
