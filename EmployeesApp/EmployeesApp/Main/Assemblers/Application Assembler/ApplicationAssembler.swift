//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class ApplicationAssembler {

    private let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }

    func assembleApplication(
        navigationController: UINavigationController
    ) -> Application {
        let authenticationService = dependencyFactory.makeAuthenticationService()
        let employeeDataStore = dependencyFactory.makeEmployeeDataStore()
        let viewControllerFactoryAssembler = ViewControllerFactoryAssembler(
            dependencyFactory: ViewControllerFactoryAssembler.DependencyFactory(
                authenticationService: authenticationService,
                dataStore: employeeDataStore
            )
        )
        let viewControllerFactory = viewControllerFactoryAssembler.assembleViewControllerFactory()
        let router = dependencyFactory.makeRouter(
            navigationController: navigationController,
            viewControllerFactory: viewControllerFactory
        )
        return Application(router: router)
    }
}
