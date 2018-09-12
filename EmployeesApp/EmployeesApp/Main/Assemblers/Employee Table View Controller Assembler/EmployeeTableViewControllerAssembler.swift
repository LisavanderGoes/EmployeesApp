//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeTableViewControllerAssembler {
    
    private let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleEmployeeTableViewController() -> UIViewController {
        
        let employeeListLayout = dependencyFactory.makeEmployeeListLayout()
        
        let viewController = dependencyFactory.makeViewController(layout: employeeListLayout)
        
        return viewController
    }
}

extension EmployeeTableViewControllerAssembler {
    
    class DependencyFactory {
        
        private let employeeList: [Employee]
        private let employeeSellectionClosure: (Employee) -> Void
        
        init(employeeList: [Employee], employeeSellectionClosure: @escaping (Employee) -> Void) {
            self.employeeList = employeeList
            self.employeeSellectionClosure = employeeSellectionClosure
        }
        
        func makeViewController(layout: EmployeeListLayout) -> TableViewController {
            return TableViewController(layout: layout)
        }
        
        func makeEmployeeListLayout() -> EmployeeListLayout {
            let cellBuilder = EmployeeListLayout.CellBuilder()
            
            let employeeListLayoutOutput = EmployeeSelectionController(closure: employeeSellectionClosure)
            
            return EmployeeListLayout(employeeList: employeeList, cellBuilder: cellBuilder, output: employeeListLayoutOutput)
        }
        
    }
}
