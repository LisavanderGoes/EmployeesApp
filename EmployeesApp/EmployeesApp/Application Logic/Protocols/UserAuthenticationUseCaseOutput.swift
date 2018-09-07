//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol UserAuthenticationUseCaseOutput {
    func authenticationStarted()
    func authenticationSucceded()
    func authenticationFailed(reason: String)
}
