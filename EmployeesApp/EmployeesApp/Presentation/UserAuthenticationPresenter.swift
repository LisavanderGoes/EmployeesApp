
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class UserAuthenticationPresenter: UserAuthenticationUseCaseOutput {
    
    private let authenticationView: AuthenticationView!
    
    init(loginView: AuthenticationView) {
        self.authenticationView = loginView
    }
    
    func authenticationStarted() {
        authenticationView.showLoadingIndicator()
        authenticationView.disableLoginButton()
    }
    
    func authenticationSucceded() {
        authenticationView.show(message: "Succes")
        authenticationView.stopAnimationLoadingIndicator()
    }
    
    func authenticationFailed(reason: String) {
        authenticationView.show(message: reason)
        authenticationView.stopAnimationLoadingIndicator()
        authenticationView.enableLoginButton()
    }
}
