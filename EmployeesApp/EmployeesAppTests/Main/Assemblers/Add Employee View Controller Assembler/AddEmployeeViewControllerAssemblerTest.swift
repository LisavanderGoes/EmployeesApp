//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class AddEmployeeViewControllerAssemblerTest: XCTestCase {
    
    var dataStore: DataStoreSpyEmployee!
    var dependencyFactory: DependencyFactorySpy!
    var sut: AddEmployeeViewControllerAssembler!
    
    override func setUp() {
        dataStore = DataStoreSpyEmployee()
        dependencyFactory = DependencyFactorySpy(dataStore: dataStore)
        sut = AddEmployeeViewControllerAssembler(dependencyFactory: dependencyFactory)
    }
    
    func test_assembleAddEmployeeViewController_returnsAddEmployeeBarButtonRecievedFromDependencyFactory() {
        XCTAssertEqual(sut.assembleAddEmployeeViewController(), dependencyFactory.capturedViewController)
    }
    
    func test() {
        let viewController = sut.assembleAddEmployeeViewController()
        _ = viewController.view
        let button = dependencyFactory.capturedAddEmployeeBarButton
        _ = button?.perform(button?.action)
        XCTAssertTrue(dataStore.didAddItem)
    }
}

class DependencyFactorySpy: AddEmployeeViewControllerAssembler.DependencyFactory {
    
    var capturedAddEmployeeBarButton: BarButtonItem?
    
    override func makeAddEmployeeBarButtonItem() -> BarButtonItem {
        capturedAddEmployeeBarButton = super.makeAddEmployeeBarButtonItem()
        return capturedAddEmployeeBarButton!
    }
    
    var capturedViewController: CustomerInformationInputViewController?
    
    override func makeViewController(addEmployeeBarButtonItem: UIBarButtonItem) -> CustomerInformationInputViewController {
        capturedViewController = super.makeViewController(addEmployeeBarButtonItem: addEmployeeBarButtonItem)
        return capturedViewController!
    }
}
