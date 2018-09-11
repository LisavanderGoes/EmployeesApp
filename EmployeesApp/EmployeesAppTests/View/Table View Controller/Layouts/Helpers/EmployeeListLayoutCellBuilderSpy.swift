//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit
@testable import EmployeesApp

class EmployeeListLayoutCellBuilderSpy: EmployeeListLayout.CellBuilder {
    
    var returnedCell: EmployeeCell!
    var capturedEmployee: PresentableEmployee?
    var capturedTableView: UITableView?
    
    override func makeCell(
        for employee: PresentableEmployee,
        for tableView: UITableView) -> EmployeeCell {
        returnedCell = super.makeCell(
            for: employee,
            for: tableView
        )
        capturedEmployee = employee
        capturedTableView = tableView
        return returnedCell!
    }
}
