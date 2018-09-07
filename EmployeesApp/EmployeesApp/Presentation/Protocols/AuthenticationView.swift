//
//  Created by WebIQ Stagiaire on 06-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol AuthenticationView {
    func show(message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func disableLoginButton()
    func enableLoginButton()
}
