//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit
@testable import EmployeesApp

class EmployeeListLayoutCellBuilderSpy: EmployeeListLayout.CellBuilder {
    
    var returnedCell: UITableViewCell!
    
    override func makeCell() -> UITableViewCell {
        returnedCell = super.makeCell()
        return returnedCell!
    }
}
