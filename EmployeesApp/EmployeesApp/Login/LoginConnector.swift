
//  Created by WebIQ Stagiaire on 06-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation


class LoginConnector {
    
    private let loginService: LoginService
    private var loginUseCaseOutput : LoginUseCaseOutput!
    
    private var loginViewController : LoginViewController!
    private var loginUseCase : LoginUseCase!
    
    init(service: LoginService) {
        self.loginService = service
    }
    
    func connectViewControllerWithUseCase(){
        loginViewController = LoginViewController()
        
        loginUseCase = LoginUseCase(loginService: loginService, loginUseCaseOutput: loginUseCaseOutput)
        
        loginViewController.loginClosure = loginUseCase.loginCredentialsCheck(username:password:)
        
    }
}
