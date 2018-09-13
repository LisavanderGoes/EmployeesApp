//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

extension EmployeeTableViewControllerAssembler {
    
    class DependencyFactory {
        
        typealias SelectionControllerEmployee = EmployeeSelectionController<Employee>
        
        private let employeeList: [Employee]
        private let employeeSellectionClosure: (Employee) -> Void
        
        init(employeeList: [Employee], employeeSellectionClosure: @escaping (Employee) -> Void) {
            self.employeeList = employeeList
            self.employeeSellectionClosure = employeeSellectionClosure
        }
        
        func makeViewController(layout: EmployeeListLayout<SelectionControllerEmployee>) -> TableViewController {
            return TableViewController(layout: layout)
        }
        
        func makeEmployeeListLayout() -> EmployeeListLayout<SelectionControllerEmployee> {
            let cellBuilder = EmployeeListLayout<SelectionControllerEmployee>.CellBuilder()
            let employeeListLayoutOutput = EmployeeSelectionController(closure: employeeSellectionClosure)
            
            return EmployeeListLayout(employeeList: employeeList, cellBuilder: cellBuilder, output: employeeListLayoutOutput)
        }
    }
}
