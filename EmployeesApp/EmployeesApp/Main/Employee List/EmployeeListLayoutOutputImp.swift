//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeListLayoutOutputImp<EmployeeType: PresentableEmployee>: EmployeeListLayoutOutput {
    
    func didSelectRow(employee: EmployeeType) {
        EmployeeSelectionController().didSelectRow(employee: employee)
    }
    
    func removeItem(at index: Int) {
    }
}
