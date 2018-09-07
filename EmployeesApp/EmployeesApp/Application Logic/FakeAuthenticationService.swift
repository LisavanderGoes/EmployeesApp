
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class FakeAuthenticationService: AuthenticationService {
    
    func authenticateUser(
        username: String,
        password: String,
        succeed: @escaping () -> Void,
        failed: @escaping (String) -> Void
    ) -> ServiceTask {
        delay(seconds: 1.5, closure: {
            if username == "lisa" && password == "webiq" {
                succeed()
            } else {
                failed("Oeps...")
            }
        })
        return FakeServiceTask()
    }
}

private func delay(seconds: TimeInterval, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: {
        closure()
    })
}

class FakeServiceTask: ServiceTask {
    func cancel() {}
}
