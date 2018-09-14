//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeSelectionController: EmployeeListLayoutOutput {
    
    let closure: ((Employee) -> Void)
    
    init(closure: @escaping (Employee) -> Void) {
        self.closure = closure
    }
    
    func didSelectRow(employee: Employee) {
        closure(employee)
    }
}
