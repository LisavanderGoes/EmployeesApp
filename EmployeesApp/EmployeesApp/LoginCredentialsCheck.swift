
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

struct LoginCredentials{
    let username : String
    let password : String
}

class LoginCredentialsCheck{
    
    let inputLoginCredentials : LoginCredentials
    let correctLoginCredentials : [LoginCredentials]
    
    init(inputLoginCredentials: LoginCredentials, correctLoginCredentials : [LoginCredentials]){
        self.inputLoginCredentials = inputLoginCredentials
        self.correctLoginCredentials = correctLoginCredentials
    }
    
    func compareInput() -> Bool{
        if !correctLoginCredentials.isEmpty{
            for loginCredentials in correctLoginCredentials{
                if (inputLoginCredentials.username.elementsEqual(loginCredentials.username) && inputLoginCredentials.password.elementsEqual(loginCredentials.password)){return true}
            }
        }
        return false
    }
}
