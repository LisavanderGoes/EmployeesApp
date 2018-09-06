
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class UserAuthenticationUseCase {
    
    private let service: AuthenticationService
    private let output: UserAuthenticationUseCaseOutput
    
    init(
        service: AuthenticationService,
        output: UserAuthenticationUseCaseOutput
    ) {
        self.service = service
        self.output = output
    }
    
    deinit {
        ongoingAuthenticationTask?.cancel()
    }
    
    private var ongoingAuthenticationTask: ServiceTask?
    
    func authenticateUser(username: String, password: String) {
        if ongoingAuthenticationTask == nil {
            ongoingAuthenticationTask = service.authenticateUser(
                username: username,
                password: password,
                succeed: { [weak self] in
                    self?.ongoingAuthenticationTask = nil
                    self?.output.authenticationSucceded()
                },
                failed: { [weak self] reason in
                    self?.ongoingAuthenticationTask = nil
                    self?.output.authenticationFailed(reason: reason)
                }
            )
        }
    }
}
