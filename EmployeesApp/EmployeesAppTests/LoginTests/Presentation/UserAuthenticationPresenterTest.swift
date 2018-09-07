
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class UserAuthenticationPresenterTest : XCTestCase{
    
    var loginView: AuthenticationViewSpy!
    var sut: UserAuthenticationPresenter!
    
    override func setUp() {
        loginView = AuthenticationViewSpy()
        sut = UserAuthenticationPresenter(loginView: loginView)
    }
    
    func test_authenticationSucceded_showsMessageOnView() {
        sut.authenticationSucceded()
        XCTAssertTrue(loginView.showIsCalled)
    }
    
    func test_authenticationSucceded_showsCorrectMessageOnView() {
        sut.authenticationSucceded()
        XCTAssertEqual(loginView.capturedMessage, "Succes")
    }
    
    func test_authenticationFailed_showsMessageOnView() {
        sut.authenticationFailed(reason: "")
        XCTAssertTrue(loginView.showIsCalled)
    }
    
    func test_authenticationFailed_showsCorrectMessageOnView() {
        let failReason = "You failed!"
        sut.authenticationFailed(reason: failReason)
        XCTAssertEqual(loginView.capturedMessage, failReason)
    }
    
    func test_authenticationSucceded_hideLoadingIndicator() {
        sut.authenticationSucceded()
        XCTAssertTrue(loginView.hideLoadingIndicatorIsCalled)
    }
}

class AuthenticationViewSpy: AuthenticationView {
    var capturedMessage: String!
    var showIsCalled: Bool = false
    
    func show(message: String) {
        showIsCalled = true
        capturedMessage = message
    }
    
    var hideLoadingIndicatorIsCalled: Bool = false

    func hideLoadingIndicator() {
        hideLoadingIndicatorIsCalled = true
    }
}
