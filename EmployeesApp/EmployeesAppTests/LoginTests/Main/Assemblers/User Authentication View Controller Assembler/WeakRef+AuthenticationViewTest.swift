//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class WeakRef_AuthenticationViewTest: XCTestCase {
    
    var view: AuthenticationViewSpy!
    var sut: WeakRef<AuthenticationViewSpy>!
    
    override func setUp() {
        view = AuthenticationViewSpy()
        sut = WeakRef(view)
    }
    
    func test_show_isCalled() {
        sut.show(message: "")
        XCTAssertTrue(view.showIsCalled)
    }
    
    func test_show_isCalledWithCorrectMessage() {
        let message = "message"
        sut.show(message: message)
        XCTAssertEqual(view.capturedMessage, message)
    }
    
    func test_showLoadingIndicator() {
        sut.showLoadingIndicator()
        XCTAssertTrue(view.showLoadingIndicatorIsCalled)
    }
    
    func test_hideLoadingIndicator() {
        sut.hideLoadingIndicator()
        XCTAssertTrue(view.hideLoadingIndicatorIsCalled)
    }
    
    func test_disableLoginButton() {
        sut.disableLoginButton()
        XCTAssertTrue(view.disableLoginButtonIsCalled)
    }
    
    func test_enableLoginButton() {
        sut.enableLoginButton()
        XCTAssertTrue(view.enableLoginButtonIsCalled)
    }
}
