//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeSelectionControllerTest: XCTestCase {
    
    func test_didSelectRow_employeeSelectionClosureIsCalled() {
        var isEmployeeSelectionClosureCalled = false
        let closure: (Employee) -> Void = { _ in
            isEmployeeSelectionClosureCalled = true
        }
        let sut = EmployeeSelectionController(closure: closure)
        sut.didSelectRow(employee: Employee(name: "", occupationCase: Occupation.Backend_Developer, emailAddress: ""))
        XCTAssertTrue(isEmployeeSelectionClosureCalled)
    }
    
    func test_closure_withRightEmployee() {
        var capturedEmployee: Employee?
        let closure: (Employee) -> Void = { employee in
            capturedEmployee = employee
        }
        let sut = EmployeeSelectionController(closure: closure)
        let employee = Employee(name: "", occupationCase: Occupation.Backend_Developer, emailAddress: "")
        sut.didSelectRow(employee: employee)
        XCTAssertEqual(capturedEmployee, employee)
    }
}

extension Employee: Equatable {
    public static func ==(lhs: Employee, rhs: Employee) -> Bool {
        return lhs.name == rhs.name && lhs.occupation == rhs.occupation && lhs.emailAddress == rhs.emailAddress
    }
}
