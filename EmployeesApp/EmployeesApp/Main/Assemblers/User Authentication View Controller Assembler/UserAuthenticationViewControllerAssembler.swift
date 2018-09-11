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
    
    func assembleUserAuthenticationViewController() -> UIViewController {
        let viewController = dependencyFactory.makeViewController()
        let presenter = dependencyFactory.makePresenter(view: WeakRef(viewController))
        let useCase = dependencyFactory.makeUseCase(
            output: presenter
        )
        viewController.loginClosure = useCase.authenticateUser
        return viewController
    }
}
