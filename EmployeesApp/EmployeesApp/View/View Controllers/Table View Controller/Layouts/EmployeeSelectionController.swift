//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeSelectionController<EmployeeType: PresentableEmployee>: EmployeeListLayoutOutput {
    
    var closure: ((EmployeeType) -> Void)!
    
    init(closure: @escaping (EmployeeType) -> Void) {
        self.closure = closure
    }
    
    func didSelectRow(employee: EmployeeType) {
        closure(employee)
    }
}
