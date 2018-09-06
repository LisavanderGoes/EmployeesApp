
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class LoginPresenter: UserAuthenticationUseCaseOutput {
    
    private let loginView : LoginView!
    
    init(loginView: LoginView){
        self.loginView = loginView
    }
    
    func authenticationSucceded() {
        loginView.show(message: Strings.checkHasSucceedMessage)
    }
    
    func authenticationFailed(reason: String) {
        loginView.show(message: reason)
    }
}
