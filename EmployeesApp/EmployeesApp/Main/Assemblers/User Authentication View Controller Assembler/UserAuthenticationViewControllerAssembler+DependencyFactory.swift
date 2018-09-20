//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

extension UserAuthenticationViewControllerAssembler {
    
    class DependencyFactory {
        
        private let service: AuthenticationService
        
        init(service: AuthenticationService) {
            self.service = service
        }
        
        func makeViewController() -> LoginViewController {
            return LoginViewController()
        }
        
        func makeUseCase(
            output: UserAuthenticationPresenter
        ) -> UserAuthenticationUseCase {
            return UserAuthenticationUseCase(
                service: service,
                output: output
            )
        }
        
        func makePresenter(
            view: AuthenticationView,
            authenticationDidSucceed: @escaping () -> Void
        ) -> UserAuthenticationPresenter {
            return UserAuthenticationPresenter(
                loginView: view,
                authenticationDidSucceed: authenticationDidSucceed
            )
        }
    }
}
