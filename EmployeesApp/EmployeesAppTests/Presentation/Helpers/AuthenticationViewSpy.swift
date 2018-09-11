//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

@testable import EmployeesApp

class AuthenticationViewSpy: AuthenticationView {
    
    var capturedMessage: String!
    var showIsCalled = false
    
    func show(message: String) {
        showIsCalled = true
        capturedMessage = message
    }
    
    var startAnimationIndicatorIsCalled = false
    
    func startAnimationLoadingIndicator() {
        startAnimationIndicatorIsCalled = true
    }
    
    var stopAnimationIndicatorIsCalled = false
    
    func stopAnimationLoadingIndicator() {
        stopAnimationIndicatorIsCalled = true
    }
    
    var disableLoginButtonIsCalled = false
    
    func disableLoginButton() {
        disableLoginButtonIsCalled = true
    }
    
    var enableLoginButtonIsCalled = false
    
    func enableLoginButton() {
        enableLoginButtonIsCalled = true
    }
}
