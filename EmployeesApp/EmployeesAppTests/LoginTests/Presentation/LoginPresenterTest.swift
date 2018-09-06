
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class LoginPresenterTest : XCTestCase{
    
    var loginView : LoginViewSpy!
    
    var sut : LoginPresenter!
    
    override func setUp(){
        loginView = LoginViewSpy()
        
        sut = LoginPresenter(loginView: loginView)
    }
    
    func test_checkHasSucceed_couldGetMessage() {
        
//        sut.checkHasSucceed()
        
//        XCTAssertEqual(loginView.capturedMessage, "Succes")
        XCTFail()
    }
    
    func test_checkHasFailed_couldGetMessage() {
//
//        sut.checkHasFailed(reason: "You failed!")
//
//        XCTAssertEqual(loginView.capturedMessage, "You failed!")
        XCTFail()
    }
}

class LoginViewSpy : LoginView {
    var capturedMessage : String!
    
    func show(message: String) {
        capturedMessage = message
    }
}
