
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class LoginCredentialsCheck: LoginService{
    
    var dataLoginCredentials : [LoginCredentials] = []
    
    func loginCredentialsCheck(username: String, password: String, succeed: () -> Void, failed: (String) -> Void) {
        
        var succeeds = 0
        
        if !dataLoginCredentials.isEmpty{
            for loginCredentials in dataLoginCredentials{
                if (username.elementsEqual(loginCredentials.username) && password.elementsEqual(loginCredentials.password)){succeeds = succeeds + 1}
            }
            if succeeds > 0 {succeed()}else{failed(Strings.loginCredentialsCheckFailed)}
        } else {
            failed(Strings.dataLoginCredentialsIsEmptyMessage)
        }
    }
}
