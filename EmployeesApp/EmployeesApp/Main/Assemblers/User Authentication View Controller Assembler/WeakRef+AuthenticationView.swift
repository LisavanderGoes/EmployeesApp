//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

extension WeakRef: AuthenticationView where T: AuthenticationView {
    
    func show(message: String) {
        object?.show(message: message)
    }
    
    func startAnimationLoadingIndicator() {
        object?.startAnimationLoadingIndicator()
    }
    
    func stopAnimationLoadingIndicator() {
        object?.stopAnimationLoadingIndicator()
    }
    
    func disableLoginButton() {
        object?.disableLoginButton()
    }
    
    func enableLoginButton() {
        object?.enableLoginButton()
    }
}
