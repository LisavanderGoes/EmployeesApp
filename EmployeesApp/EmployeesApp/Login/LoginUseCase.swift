
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class LoginUseCase {
    
    private let loginService : LoginService
    //private var loginUseCaseOutput : LoginUseCaseOutput
    
    var checkHasSucceed : Bool!
    
    init(loginService: LoginService){
        self.loginService = loginService
       // self.loginUseCaseOutput = loginUseCaseOutput
    }
    
    func loginCredentialsCheck (username: String, password: String){
        checkHasSucceed = loginService.loginCredentialsCheck(username: username, password: password)
    }
}
