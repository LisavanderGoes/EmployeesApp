//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    let userAuthenticationViewControllerAssembler: UserAuthenticationViewControllerAssembler
    let addEmployeeViewControllerAssembler: AddEmployeeViewControllerAssembler
    let employeeListViewControllerAssembler: EmployeeTableViewControllerAssembler

    
    init(authenticationViewControllerAssembler: UserAuthenticationViewControllerAssembler,
         addEmployeeViewControllerAssembler: AddEmployeeViewControllerAssembler,
         employeeListViewControllerAssembler: EmployeeTableViewControllerAssembler) {
        self.userAuthenticationViewControllerAssembler = authenticationViewControllerAssembler
        self.addEmployeeViewControllerAssembler = addEmployeeViewControllerAssembler
        self.employeeListViewControllerAssembler = employeeListViewControllerAssembler
    }
    
    func assembleAuthenticationViewController(authenticationDidSucceed: @escaping () -> Void) -> UIViewController {
        return userAuthenticationViewControllerAssembler.assembleUserAuthenticationViewController(authenticationDidSucceed: authenticationDidSucceed)
    }
    
    func assembleAddEmployeeViewController() -> UIViewController {
        return addEmployeeViewControllerAssembler.assembleAddEmployeeViewController()
    }
    
    func assembleEmployeeTableViewController(didAddItemClosure: @escaping () -> Void) -> UIViewController {
        return employeeListViewControllerAssembler.assembleEmployeeTableViewController(didAddItemClosure: didAddItemClosure)
    }
}
