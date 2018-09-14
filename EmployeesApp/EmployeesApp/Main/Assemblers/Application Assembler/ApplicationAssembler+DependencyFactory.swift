//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

extension ApplicationAssembler {
    
    class DependencyFactory {
        
        func makeAuthenticationService() -> AuthenticationService {
            return FakeAuthenticationService()
        }
        
        func makeEmployeeDataStore() -> DataStore<Employee> {
            let dataStore = DataStore<Employee>()
            let employees = [
                Employee(
                    name: "Peter",
                    occupationCase: .iosDeveloper,
                    emailAddress: "peter@webiq.nl"
                )
            ]
            employees.enumerated().forEach { index, employee in
                dataStore.add(item: employee, atIndex: index)
            }
            return dataStore
        }
        
        func makeRouter(
            navigationController: UINavigationController,
            viewControllerFactory: ViewControllerFactory
        ) -> Router {
            return Router(
                navigationController: navigationController,
                viewControllerFactory: viewControllerFactory
            )
        }
    }
}
