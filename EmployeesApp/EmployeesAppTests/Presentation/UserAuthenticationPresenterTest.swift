//
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

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
    
    func test_authenticationSucceded_stopAnimationLoadingIndicatorr() {
        sut.authenticationSucceded()
        XCTAssertTrue(authenticationView.stopAnimationIndicatorIsCalled)
    }
    
    func test_authenticationSucceded_

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
        sut.authenticationStarted()
        XCTAssertTrue(authenticationView.startAnimationIndicatorIsCalled)
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
