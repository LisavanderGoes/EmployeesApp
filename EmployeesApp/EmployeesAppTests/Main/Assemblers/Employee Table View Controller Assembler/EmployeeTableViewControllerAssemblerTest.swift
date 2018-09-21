//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeTableViewControllerAssemblerTest: XCTestCase {
    
    var dependencyFactorySpy: EmployeeTableViewControllerAssemblerTestDependencyFactorySpy!
    var sut: EmployeeTableViewControllerAssembler!
    var dataStore: DataStore<Employee>!
    
    override func setUp() {
        let employees = [Employee(name: "name1", occupationCase: Occupation.Backend_Developer, emailAddress: "email")]
        
        dataStore = DataStore<Employee>()
        
        employees.forEach { employee in
            dataStore.add(item: employee)
        }
        
        dependencyFactorySpy = EmployeeTableViewControllerAssemblerTestDependencyFactorySpy(dataStore: dataStore)
        
        sut = EmployeeTableViewControllerAssembler(dependencyFactory: dependencyFactorySpy)
    }
    
    func test_assembleEmployeeTableViewController_returnsViewControllerRecievedFromDependencyFactory() {
        XCTAssertTrue(sut.assembleEmployeeTableViewController(didAddItemClosure: {}) === dependencyFactorySpy.returnedViewController)
    }
    
    func test_dataStore_outputIsSet() {
        _ = sut.assembleEmployeeTableViewController(didAddItemClosure: {})
        XCTAssertNotNil(dataStore.output)
    }
}
