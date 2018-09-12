//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeSelectionController: EmployeeListLayoutOutput {
    
    var closure: ((PresentableEmployee) -> Void)!
    
    init(closure: @escaping (PresentableEmployee) -> Void) {
        self.closure = closure
    }
    
    func didSelectRow(employee: PresentableEmployee) {
        closure(employee)
    }
}
