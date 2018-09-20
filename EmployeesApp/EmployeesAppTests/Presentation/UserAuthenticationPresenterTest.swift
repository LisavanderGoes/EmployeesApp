//
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class UserAuthenticationPresenterTest : XCTestCase{
    
    var authenticationView: AuthenticationViewSpy!
    
    override func setUp() {
        authenticationView = AuthenticationViewSpy()
    }
    
    // MARK: authenticationSucceded related
    func test_authenticationSucceded_showsMessageOnView() {
        makeSUT().authenticationSucceded()
        XCTAssertTrue(authenticationView.showIsCalled)
    }
    
    func test_authenticationSucceded_showsCorrectMessageOnView() {
        makeSUT().authenticationSucceded()
        XCTAssertEqual(authenticationView.capturedMessage, "Succes")
    }
    
    func test_authenticationSucceded_stopAnimationLoadingIndicatorr() {
        makeSUT().authenticationSucceded()
        XCTAssertTrue(authenticationView.stopAnimationIndicatorIsCalled)
    }
    
    func test_authenticationSucceded_authenticationDidSucceedClosure() {
        var closureIsCalled = false
        let closure = {
            closureIsCalled = true
        }
        makeSUT(authenticationDidSucceed: closure).authenticationSucceded()
        XCTAssertTrue(closureIsCalled)
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
    
    func test_authenticationFailed_stopAnimationLoadingIndicator() {
        authenticationFailed()
        XCTAssertTrue(authenticationView.stopAnimationIndicatorIsCalled)
    }
    
    func test_authenticationFailed_enableLoginButton() {
        authenticationFailed()
        XCTAssertTrue(authenticationView.enableLoginButtonIsCalled)
    }
    
    // MARK: authenticationStarted related
    func test_authenticationStarted_startAnimationLoadingIndicator() {
        makeSUT().authenticationStarted()
        XCTAssertTrue(authenticationView.startAnimationIndicatorIsCalled)
    }
    
    func test_authenticationStarted_disableLoginButton() {
        makeSUT().authenticationStarted()
        XCTAssertTrue(authenticationView.disableLoginButtonIsCalled)
    }
    
    // MARK: Helpers
    func authenticationFailed(reason: String = "") {
        makeSUT().authenticationFailed(reason: reason)
    }
    
    func makeSUT(authenticationDidSucceed: @escaping () -> Void = {}) -> UserAuthenticationPresenter {
        return UserAuthenticationPresenter(loginView: authenticationView, authenticationDidSucceed: authenticationDidSucceed)
    }
    
}
