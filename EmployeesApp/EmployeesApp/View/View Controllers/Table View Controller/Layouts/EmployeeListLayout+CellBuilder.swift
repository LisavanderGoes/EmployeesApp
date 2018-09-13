//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

extension EmployeeListLayout {
    class CellBuilder {
        func makeCell(
            for employee: EmployeeType,
            for tableView: UITableView
        ) -> EmployeeCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "EmployeeCell"
            ) as! EmployeeCell
            cell.set(name: employee.name)
            cell.set(occupation: employee.occupation)
            cell.set(emailAddress: employee.emailAddress)
            return cell
        }
    }
}
