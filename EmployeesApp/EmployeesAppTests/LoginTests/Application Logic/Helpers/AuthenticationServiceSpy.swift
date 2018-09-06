//
//  Created by Peter Combee on 06/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class AuthenticationServiceSpy: AuthenticationService {

    var authenticateUserCalled = false
    var capturedUsername: String?
    var capturedPassword: String?
    var capturedSuccessClosure: (() -> Void)?
    var capturedFailureClosure: ((String) -> Void)?
    var returnedAuthenticationTask: ServiceTaskSpy?
    
    func authenticateUser(
        username: String,
        password: String,
        succeed: @escaping () -> Void,
        failed: @escaping (String) -> Void
    ) -> ServiceTask {
        authenticateUserCalled = true
        capturedUsername = username
        capturedPassword = password
        capturedSuccessClosure = succeed
        capturedFailureClosure = failed
        returnedAuthenticationTask = ServiceTaskSpy()
        return returnedAuthenticationTask!
    }
}

class ServiceTaskSpy: ServiceTask {
    
    var canceled = false
    
    func cancel() {
        canceled = true
    }
}
