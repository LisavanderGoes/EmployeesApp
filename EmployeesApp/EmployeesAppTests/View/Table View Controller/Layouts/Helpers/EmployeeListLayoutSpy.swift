//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class EmployeeListLayoutOutputSpy: EmployeeListLayoutOutput {
    
    var didSelectRowIsCalled = false
    var capturedEmployee: EmployeeMock?
    
    func didSelectRow(employee: EmployeeMock) {
        didSelectRowIsCalled = true
        capturedEmployee = employee
    }
}
