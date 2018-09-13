//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit
@testable import EmployeesApp

class EmployeeListLayoutCellBuilderSpy: EmployeeListLayout<EmployeeListLayoutOutputSpy>.CellBuilder {
    
    typealias EmployeeType = EmployeeMock
    
    var returnedCell: EmployeeCell!
    var capturedEmployee: EmployeeMock?
    var capturedTableView: UITableView?
    
    override func makeCell(
        for employee: EmployeeType,
        for tableView: UITableView) -> EmployeeCell {
        returnedCell = super.makeCell(
            for: employee,
            for: tableView
        )
        capturedEmployee = employee
        capturedTableView = tableView
        tableView.inser
        return returnedCell!
    }
}
