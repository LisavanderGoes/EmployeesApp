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
            output: ComposedUserAuthenticationUseCaseOutput
        ) -> UserAuthenticationUseCase {
            return UserAuthenticationUseCase(
                service: service,
                output: output
            )
        }
        
        func makeUseCaseOutput(
            authenticationDidSucceed: @escaping () -> Void,
            presenter: UserAuthenticationPresenter
        ) -> ComposedUserAuthenticationUseCaseOutput {
            return ComposedUserAuthenticationUseCaseOutput(
                authenticationDidSucceed: authenticationDidSucceed,
                presenter: presenter
            )
        }
        
        func makePresenter(
            view: AuthenticationView
        ) -> UserAuthenticationPresenter {
            return UserAuthenticationPresenter(
                loginView: view
            )
        }
    }
}
