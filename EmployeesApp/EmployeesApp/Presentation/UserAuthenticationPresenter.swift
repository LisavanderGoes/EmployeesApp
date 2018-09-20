
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class UserAuthenticationPresenter: UserAuthenticationUseCaseOutput {
    
    private let authenticationView: AuthenticationView
    private var authenticationDidSucceed: () -> Void
    
    init(loginView: AuthenticationView, authenticationDidSucceed: @escaping () -> Void) {
        self.authenticationView = loginView
        self.authenticationDidSucceed = authenticationDidSucceed
    }
    
    func authenticationStarted() {
        authenticationView.startAnimationLoadingIndicator()
        authenticationView.disableLoginButton()
    }
    
    func authenticationSucceded() {
        authenticationView.show(message: "Succes")
        authenticationView.stopAnimationLoadingIndicator()
        authenticationDidSucceed()
    }
    
    func authenticationFailed(reason: String) {
        authenticationView.show(message: reason)
        authenticationView.stopAnimationLoadingIndicator()
        authenticationView.enableLoginButton()
    }
}
