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
        
        let dataStore = DataStore<Employee>()
        dataStore.output = DataStoreOutputSpy()
        dependencyFactorySpy = EmployeeTableViewControllerAssemblerTestDependencyFactorySpy()
        
        sut = EmployeeTableViewControllerAssembler(dependencyFactory: dependencyFactorySpy, dataStore: dataStore)
    }
    
    func test_assembleEmployeeTableViewController_returnsViewControllerRecievedFromDependencyFactory() {
        XCTAssertTrue(sut.assembleEmployeeTableViewController() === dependencyFactorySpy.returnedViewController)
    }
}
