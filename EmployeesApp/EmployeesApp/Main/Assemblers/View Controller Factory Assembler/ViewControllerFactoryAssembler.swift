//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation


class ViewControllerFactoryAssembler {
    
    let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleViewControllerFactory() -> ViewControllerFactory {
        
        let userAuthenticationViewControllerAssembler = dependencyFactory.makeUserUserAuthenticationViewControllerAssembler(dependencyFactory: dependencyFactory.makeUserAuthenticationViewControllerAssemblerDependencyFactory())
        
        let addEmployeeViewControllerAssembler = dependencyFactory.makeAddEmployeeViewControllerAssembler(dependencyFactory: dependencyFactory.makeAddEmployeeViewControllerAssemblerDependencyFactory())
        
        let employeeTableViewControllerAssembler = dependencyFactory.makeEmployeeTableViewControllerAssembler(dependencyFactory: dependencyFactory.makeEmployeeTableViewControllerAssemblerDependencyFactory())

        let viewControllerFactory = dependencyFactory.makeViewControllerFactory(userAuthenticationViewControllerAssembler: userAuthenticationViewControllerAssembler,
                                                                                addEmployeeViewControllerAssembler: addEmployeeViewControllerAssembler,
                                                                                employeeTableViewControllerAssembler: employeeTableViewControllerAssembler)
        return viewControllerFactory
    }
}

extension ViewControllerFactoryAssembler {
    
    class DependencyFactory {
        
        var authenticationService: AuthenticationService
        var dataStore: DataStore<Employee>
        
        init(authenticationService: AuthenticationService, dataStore: DataStore<Employee>) {
            self.authenticationService = authenticationService
            self.dataStore = dataStore
        }
        
        func makeUserAuthenticationViewControllerAssemblerDependencyFactory() -> UserAuthenticationViewControllerAssembler.DependencyFactory {
            return UserAuthenticationViewControllerAssembler.DependencyFactory(service: authenticationService)
        }
        
        func makeUserUserAuthenticationViewControllerAssembler(dependencyFactory: UserAuthenticationViewControllerAssembler.DependencyFactory) -> UserAuthenticationViewControllerAssembler {
            return UserAuthenticationViewControllerAssembler(dependencyFactory: dependencyFactory)
        }
        
        func makeAddEmployeeViewControllerAssemblerDependencyFactory() -> AddEmployeeViewControllerAssembler.DependencyFactory {
            return AddEmployeeViewControllerAssembler.DependencyFactory(dataStore: dataStore)
        }
        
        func makeAddEmployeeViewControllerAssembler(dependencyFactory: AddEmployeeViewControllerAssembler.DependencyFactory) -> AddEmployeeViewControllerAssembler {
            return AddEmployeeViewControllerAssembler(dependencyFactory: dependencyFactory)
        }
        
        func makeEmployeeTableViewControllerAssemblerDependencyFactory() -> EmployeeTableViewControllerAssembler.DependencyFactory {
            return EmployeeTableViewControllerAssembler.DependencyFactory(dataStore: dataStore)
        }
        
        func makeEmployeeTableViewControllerAssembler(dependencyFactory: EmployeeTableViewControllerAssembler.DependencyFactory) -> EmployeeTableViewControllerAssembler {
            return EmployeeTableViewControllerAssembler(dependencyFactory: dependencyFactory)
        }
        
        func makeViewControllerFactory(userAuthenticationViewControllerAssembler: UserAuthenticationViewControllerAssembler,
                                       addEmployeeViewControllerAssembler: AddEmployeeViewControllerAssembler,
                                       employeeTableViewControllerAssembler: EmployeeTableViewControllerAssembler) -> ViewControllerFactory {
            return ViewControllerFactory(authenticationViewControllerAssembler: userAuthenticationViewControllerAssembler,
                                         addEmployeeViewControllerAssembler: addEmployeeViewControllerAssembler,
                                         employeeListViewControllerAssembler: employeeTableViewControllerAssembler
            )
        }
        
    }
}
