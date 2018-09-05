
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
    let dataLoginCredentials : [LoginCredentials]
    
    init(inputLoginCredentials: LoginCredentials, dataLoginCredentials : [LoginCredentials]){
        self.inputLoginCredentials = inputLoginCredentials
        self.dataLoginCredentials = dataLoginCredentials
    }
    
    func compareInputToData() -> Bool{
        if !dataLoginCredentials.isEmpty{
            for loginCredentials in dataLoginCredentials{
                if (inputLoginCredentials.username.elementsEqual(loginCredentials.username) && inputLoginCredentials.password.elementsEqual(loginCredentials.password)){return true}
            }
        }
        return false
    }
}
