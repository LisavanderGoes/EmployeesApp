
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class LoginPresenter : LoginUseCaseOutput {
    
    private let loginView : LoginView!
    
    init(loginView: LoginView){
        self.loginView = loginView
    }
    
    func checkHasSucceed() {
        loginView.show(message: Strings.checkHasSucceedMessage)
    }
    
    func checkHasFailed(reason: String) {
        loginView.show(message: reason)
    }
}
