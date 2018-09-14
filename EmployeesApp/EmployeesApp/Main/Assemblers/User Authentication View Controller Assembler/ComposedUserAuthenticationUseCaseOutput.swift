//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class ComposedUserAuthenticationUseCaseOutput: UserAuthenticationUseCaseOutput {
    
    private let authenticationDidSucceedClosure: () -> Void
    private let presenter: UserAuthenticationPresenter
    
    init(
        authenticationDidSucceed: @escaping () -> Void,
        presenter: UserAuthenticationPresenter
    ) {
        self.authenticationDidSucceedClosure = authenticationDidSucceed
        self.presenter = presenter
    }
    
    func authenticationStarted() {
        presenter.authenticationStarted()
    }
    
    func authenticationSucceded() {
        presenter.authenticationSucceded()
        authenticationDidSucceedClosure()
    }
    
    func authenticationFailed(reason: String) {
        presenter.authenticationFailed(reason: reason)
    }
}
