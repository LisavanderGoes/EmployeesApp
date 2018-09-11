//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

@testable import EmployeesApp

class UserAuthenticationUseCaseSpy: UserAuthenticationUseCase {
    
    var authenticateUserIsCalled = false
    
    override func authenticateUser(username: String, password: String) {
        authenticateUserIsCalled = true
    }
}
