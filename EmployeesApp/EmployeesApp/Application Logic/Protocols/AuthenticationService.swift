//
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol ServiceTask {
    func cancel()
}

protocol AuthenticationService {
    func authenticateUser(
        username: String,
        password: String,
        succeed: @escaping () -> Void,
        failed: @escaping (String) -> Void
    ) -> ServiceTask
}
