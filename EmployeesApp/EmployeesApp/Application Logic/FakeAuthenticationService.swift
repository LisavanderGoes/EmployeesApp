
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class FakeAuthenticationService: AuthenticationService {
    
    var dataLoginCredentials: [LoginCredentials] = []
    
    func authenticateUser(
        username: String,
        password: String,
        succeed: @escaping () -> Void,
        failed: @escaping (String) -> Void
    ) -> ServiceTask {
        
        var succeeds = 0
        
        if !dataLoginCredentials.isEmpty{
            for loginCredentials in dataLoginCredentials{
                if (username.elementsEqual(loginCredentials.username) && password.elementsEqual(loginCredentials.password)){succeeds = succeeds + 1}
            }
            if succeeds > 0 {succeed()}else{failed(Strings.loginCredentialsCheckFailed)}
        } else {
            failed(Strings.dataLoginCredentialsIsEmptyMessage)
        }
        
        return FakeServiceTask()
    }
}

class FakeServiceTask: ServiceTask {
    func cancel() {}
}
