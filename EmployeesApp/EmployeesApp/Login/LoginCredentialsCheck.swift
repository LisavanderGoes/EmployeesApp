
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

struct LoginCredentials{
    let username : String
    let password : String
}

class LoginCredentialsCheck: LoginService{
    
    var dataLoginCredentials : [LoginCredentials] = []
    
    func loginCredentialsCheck(username: String, password: String) -> Bool {
        if !dataLoginCredentials.isEmpty{
            for loginCredentials in dataLoginCredentials{
                if (username.elementsEqual(loginCredentials.username) && password.elementsEqual(loginCredentials.password)){return true}
            }
        }
        return false
    }
}
