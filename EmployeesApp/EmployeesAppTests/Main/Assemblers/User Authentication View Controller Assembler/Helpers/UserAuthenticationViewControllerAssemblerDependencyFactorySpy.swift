//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit
@testable import EmployeesApp

class UserAuthenticationViewControllerAssemblerDependencyFactorySpy: UserAuthenticationViewControllerAssembler.DependencyFactory {
    
    var returnedViewController: LoginViewController?
    
    override func makeViewController() -> LoginViewController {
        returnedViewController = super.makeViewController()
        return returnedViewController!
    }
    
    var returnedUseCase: UserAuthenticationUseCaseSpy?
    
    override func makeUseCase(
        output: UserAuthenticationPresenter
    ) -> UserAuthenticationUseCase {
        returnedUseCase = UserAuthenticationUseCaseSpy(
            service: AuthenticationServiceSpy(),
            output: UserAuthenticationUseCaseOutputSpy()
        )
        return returnedUseCase!
    }
}
