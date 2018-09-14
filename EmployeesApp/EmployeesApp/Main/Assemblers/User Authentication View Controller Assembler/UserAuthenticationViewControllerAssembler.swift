//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class UserAuthenticationViewControllerAssembler {
    
    private let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleUserAuthenticationViewController(
        authenticationDidSucceed: @escaping () -> Void
    ) -> UIViewController {
        let viewController = dependencyFactory.makeViewController()
        let presenter = dependencyFactory.makePresenter(view: WeakRef(viewController))
        let composedUseCaseOutput = dependencyFactory.makeUseCaseOutput(
            authenticationDidSucceed: authenticationDidSucceed,
            presenter: presenter
        )
        let useCase = dependencyFactory.makeUseCase(
            output: composedUseCaseOutput
        )
        viewController.loginClosure = useCase.authenticateUser
        return viewController
    }
}
