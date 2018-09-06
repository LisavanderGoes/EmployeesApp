//
//  Created by Peter Combee on 06/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class UserAuthenticationUseCaseOutputSpy: UserAuthenticationUseCaseOutput {
    
    var authenticationSuccededCalled = false
    
    func authenticationSucceded() {
        authenticationSuccededCalled = true
    }
    
    var authenticationFailedCalled = false
    var capturedReason: String?
    
    func authenticationFailed(reason: String) {
        authenticationFailedCalled = true
        capturedReason = reason
    }
}
