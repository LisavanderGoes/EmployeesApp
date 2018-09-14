//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    private let authenticationViewControllerAssembler: UserAuthenticationViewControllerAssembler
    private let addEmployeeViewControllerAssembler: AddEmployeeViewControllerAssembler
    private let employeeListViewControllerAssembler: EmployeeListViewControllerAssembler
    
    init(
        authenticationViewControllerAssembler: UserAuthenticationViewControllerAssembler,
        addEmployeeViewControllerAssembler: AddEmployeeViewControllerAssembler,
        employeeListViewControllerAssembler: EmployeeListViewControllerAssembler
    ) {
        self.authenticationViewControllerAssembler = authenticationViewControllerAssembler
        self.addEmployeeViewControllerAssembler = addEmployeeViewControllerAssembler
        self.employeeListViewControllerAssembler = employeeListViewControllerAssembler
    }
    
    func makeAuthenticationViewController(authenticationDidSucceed: @escaping () -> Void) -> UIViewController {
        return authenticationViewControllerAssembler.assembleUserAuthenticationViewController(
            authenticationDidSucceed: authenticationDidSucceed
        )
    }
    
    func makeAddEmployeeViewController(didAddEmployee: @escaping () -> Void) -> UIViewController {
        return addEmployeeViewControllerAssembler.assembleAddEmployeeViewController(didAddEmployee: didAddEmployee)
    }
    
    func makeEmployeeListViewController(
        didSelectEmployee: @escaping (Employee) -> Void
    ) -> UIViewController {
        return employeeListViewControllerAssembler.assembleEmployeeTableViewController(
            didSelectEmployee: didSelectEmployee
        )
    }
}
