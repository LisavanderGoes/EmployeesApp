//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeTableViewControllerAssemblerTest: XCTestCase {
    
    var dependencyFactorySpy: EmployeeTableViewControllerAssemblerTestDependencyFactorySpy!
    var sut: EmployeeTableViewControllerAssembler!
    
    override func setUp() {
        let list = [Employee(name: "", occupationCase: Occupation.Backend_Developer, emailAddress: "")]
        let closure: (Employee) -> Void = { _ in }
        
        dependencyFactorySpy = EmployeeTableViewControllerAssemblerTestDependencyFactorySpy(employeeList: list, employeeSellectionClosure: closure)
        
        sut = EmployeeTableViewControllerAssembler(dependencyFactory: dependencyFactorySpy)
    }
    
    func test_assembleEmployeeTableViewController_returnsViewControllerRecievedFromDependencyFactory() {
        XCTAssertTrue(sut.assembleEmployeeTableViewController() === dependencyFactorySpy.returnedViewController)
    }
}

class EmployeeTableViewControllerAssemblerTestDependencyFactorySpy: EmployeeTableViewControllerAssembler.DependencyFactory {
    
    var returnedViewController: TableViewController?
    var returnedEmployeeListLayout: EmployeeListLayout?
    
    override func makeEmployeeListLayout() -> EmployeeListLayout {
        returnedEmployeeListLayout = super.makeEmployeeListLayout()
        return returnedEmployeeListLayout!
    }
    
    override func makeViewController(layout: EmployeeListLayout) -> TableViewController {
        returnedViewController = super.makeViewController(layout: layout)
        return returnedViewController!
    }
}
