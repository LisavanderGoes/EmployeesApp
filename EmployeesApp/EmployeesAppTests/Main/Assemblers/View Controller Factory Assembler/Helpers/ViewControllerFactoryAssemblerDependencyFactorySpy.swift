//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class ViewControllerFactoryAssemblerDependencyFactorySpy: ViewControllerFactoryAssembler.DependencyFactory {
    
    var capturedViewControllerFactory: ViewControllerFactory?
    
    override func makeViewControllerFactory(userAuthenticationViewControllerAssembler: UserAuthenticationViewControllerAssembler, addEmployeeViewControllerAssembler: AddEmployeeViewControllerAssembler, employeeTableViewControllerAssembler: EmployeeTableViewControllerAssembler) -> ViewControllerFactory {
        capturedViewControllerFactory = super.makeViewControllerFactory(userAuthenticationViewControllerAssembler: userAuthenticationViewControllerAssembler, addEmployeeViewControllerAssembler: addEmployeeViewControllerAssembler, employeeTableViewControllerAssembler: employeeTableViewControllerAssembler)
        return capturedViewControllerFactory!
    }
}
