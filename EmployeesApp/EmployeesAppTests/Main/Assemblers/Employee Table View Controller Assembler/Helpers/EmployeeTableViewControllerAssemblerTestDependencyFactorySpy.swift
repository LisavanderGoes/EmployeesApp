//
//  Created by WebIQ Stagiaire on 13-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class EmployeeTableViewControllerAssemblerTestDependencyFactorySpy: EmployeeTableViewControllerAssembler.DependencyFactory {
    
    var returnedViewController: TableViewController?
    
    override func makeViewController(layout: EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee>) -> TableViewController {
        returnedViewController = super.makeViewController(layout: layout)
        return returnedViewController!
    }
}
