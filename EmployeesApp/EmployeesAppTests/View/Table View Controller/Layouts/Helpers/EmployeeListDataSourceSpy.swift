//
//  Created by WebIQ Stagiaire on 17-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class EmployeeListDataSourceSpy: EmployeeListDataSource {
    
    typealias EmployeeType = EmployeeListLayoutOutputSpy.EmployeeType
    
    var employeeList: [EmployeeMock]!
    
    init(employeeList: [EmployeeMock]) {
        self.employeeList = employeeList
    }
    
    func getEmployee(forRow at: Int) -> EmployeeType {
        return employeeList[at]
    }
    
    func getEmployeeCount() -> Int {
        return employeeList.count
    }
}
