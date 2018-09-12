//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeSelectionControllerTest: XCTestCase {
    
    func test_didSelectRow_employeeSelectionClosureIsCalled() {
        var isEmployeeSelectionClosureCalled = false
        let closure: (PresentableEmployee) -> Void = { _ in
            isEmployeeSelectionClosureCalled = true
        }
        let sut = EmployeeSelectionController(closure: closure)
        sut.didSelectRow(employee: PresentableEmployeeSpy())
        XCTAssertTrue(isEmployeeSelectionClosureCalled)
    }
    
    func test_closure_withRightEmployee() {
        var capturedEmployee: PresentableEmployee?
        let closure: (PresentableEmployee) -> Void = { employee in
            capturedEmployee = employee
        }
        let sut = EmployeeSelectionController(closure: closure)
        let employee = PresentableEmployeeSpy()
        sut.didSelectRow(employee: employee)
        XCTAssertEqual(capturedEmployee as! PresentableEmployeeSpy, employee)
    }
}
