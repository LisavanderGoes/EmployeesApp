
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class UserAuthenticationPresenter: UserAuthenticationUseCaseOutput {
    func authenticationStarted() {
        
    }
    
    
    private let loginView: AuthenticationView!
    
    init(loginView: AuthenticationView) {
        self.loginView = loginView
    }
    
    func authenticationSucceded() {
        loginView.show(message: "Succes")
        loginView.hideLoadingIndicator()
    }
    
    func authenticationFailed(reason: String) {
        loginView.show(message: reason)
        loginView.hideLoadingIndicator()
    }
}
