//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

extension ViewControllerFactoryAssembler {
    
    class DependencyFactory {
        
        private let authenticationService: AuthenticationService
        private let dataStore: DataStore<Employee>
        
        init(
            authenticationService: AuthenticationService,
            dataStore: DataStore<Employee>
        ) {
            self.authenticationService = authenticationService
            self.dataStore = dataStore
        }
        
        func makeAuthenticationViewControllerAssemblerDependencyFactory() -> UserAuthenticationViewControllerAssembler.DependencyFactory {
            return UserAuthenticationViewControllerAssembler.DependencyFactory(service: authenticationService)
        }
        
        func makeAuthenticationViewControllerAssembler(
            dependencyFactory: UserAuthenticationViewControllerAssembler.DependencyFactory
        ) -> UserAuthenticationViewControllerAssembler {
            return UserAuthenticationViewControllerAssembler(
                dependencyFactory: dependencyFactory
            )
        }
        
        func makeAddEmployeeViewControllerAssemblerDependencyFactory() -> AddEmployeeViewControllerAssembler.DependencyFactory {
            return AddEmployeeViewControllerAssembler.DependencyFactory()
        }
        
        func makeAddEmployeeViewControllerAssembler(
            dependencyFactory: AddEmployeeViewControllerAssembler.DependencyFactory
        ) -> AddEmployeeViewControllerAssembler {
            return AddEmployeeViewControllerAssembler(
                dataStore: dataStore,
                dependencyFactory: dependencyFactory
            )
        }
        
        func makeEmployeeListViewControllerAssemblerDependencyFactory() -> EmployeeListViewControllerAssembler.DependencyFactory {
            return EmployeeListViewControllerAssembler.DependencyFactory()
        }
        
        func makeEmployeeListViewControllerAssembler(
            dependencyFactory: EmployeeListViewControllerAssembler.DependencyFactory
        ) -> EmployeeListViewControllerAssembler {
            return EmployeeListViewControllerAssembler(
                dataStore: dataStore,
                dependencyFactory: dependencyFactory
            )
        }
    }
}
