//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeSelectionControllerTest: XCTestCase {
    
    func test_didSelectRow_employeeSelectionClosureIsCalled() {
        var isEmployeeSelectionClosureCalled = false
        let closure: (EmployeeMock) -> Void = { _ in
            isEmployeeSelectionClosureCalled = true
        }
        let sut = EmployeeSelectionController(closure: closure)
        sut.didSelectRow(employee: EmployeeMock(name: "", occupation: "Backend_Developer", emailAddress: ""))
        XCTAssertTrue(isEmployeeSelectionClosureCalled)
    }
    
    func test_closure_withRightEmployee() {
        var capturedEmployee: EmployeeMock?
        let closure: (EmployeeMock) -> Void = { employee in
            capturedEmployee = employee
        }
        let sut = EmployeeSelectionController(closure: closure)
        let employee = EmployeeMock(name: "", occupation: "Backend_Developer", emailAddress: "")
        sut.didSelectRow(employee: employee)
        XCTAssertEqual(capturedEmployee, employee)
    }
}
