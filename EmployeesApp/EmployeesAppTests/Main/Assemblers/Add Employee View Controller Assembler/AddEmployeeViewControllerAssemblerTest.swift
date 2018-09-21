//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class AddEmployeeViewControllerAssemblerTest: XCTestCase {
    
    var dataStore: DataStoreSpyEmployee!
    var dependencyFactory: AddEmployeeViewControllerAssemblerDependencyFactorySpy!
    var sut: AddEmployeeViewControllerAssembler!
    
    override func setUp() {
        dataStore = DataStoreSpyEmployee()
        dependencyFactory = AddEmployeeViewControllerAssemblerDependencyFactorySpy(dataStore: dataStore)
        sut = AddEmployeeViewControllerAssembler(dependencyFactory: dependencyFactory)
    }
    
    func test_assembleAddEmployeeViewController_returnsAddEmployeeBarButtonRecievedFromDependencyFactory() {
        XCTAssertEqual(sut.assembleAddEmployeeViewController(), dependencyFactory.capturedViewController)
    }
    
    func test_tabActionClosure_dataStoreDidAddItem() {
        let viewController = sut.assembleAddEmployeeViewController()
        _ = viewController.view
        let button = dependencyFactory.capturedAddEmployeeBarButton
        _ = button?.perform(button?.action)
        XCTAssertTrue(dataStore.didAddItem)
    }
    
    func test_viewController_hasNavigationRightBarButtonItem() {
        XCTAssertNotNil(sut.assembleAddEmployeeViewController().navigationItem.rightBarButtonItem)
    }
}

