//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class ViewControllerFactoryTest: XCTestCase {
    
    var sut: ViewControllerFactory!
    var userAuthenticationViewControllerAssembler: UserAuthenticationViewControllerAssemblerSpy!
    var addEmployeeViewControllerAssembler: AddEmployeeViewControllerAssemblerSpy!
    var employeeListViewControllerAssembler: EmployeeTableViewControllerAssemblerSpy!
    
    override func setUp() {
        let dataStore = DataStore<Employee>()
        userAuthenticationViewControllerAssembler = UserAuthenticationViewControllerAssemblerSpy(dependencyFactory: UserAuthenticationViewControllerAssembler.DependencyFactory(service: AuthenticationServiceSpy()))
        
        addEmployeeViewControllerAssembler = AddEmployeeViewControllerAssemblerSpy(dependencyFactory: AddEmployeeViewControllerAssembler.DependencyFactory(dataStore: dataStore))
        
        employeeListViewControllerAssembler = EmployeeTableViewControllerAssemblerSpy(dependencyFactory: EmployeeTableViewControllerAssembler.DependencyFactory(dataStore: dataStore))
        
        sut = ViewControllerFactory(authenticationViewControllerAssembler: userAuthenticationViewControllerAssembler,
                                    addEmployeeViewControllerAssembler: addEmployeeViewControllerAssembler,
                                    employeeListViewControllerAssembler: employeeListViewControllerAssembler
        )
    }
    
    func test_assembleAuthenticationViewController_returnCorrectViewController() {
        XCTAssertEqual(sut.assembleAuthenticationViewController(authenticationDidSucceed: {}),
                       userAuthenticationViewControllerAssembler.capturedUserAuthenticationViewController)
    }
    
    func test_assembleAddEmployeeViewController_returnCorrectViewController() {
        XCTAssertEqual(sut.assembleAddEmployeeViewController(),
                      addEmployeeViewControllerAssembler.capturedAddEmployeeViewController)
    }
    
    func test_assembleEmployeeTableViewController_returnCorrectViewController() {
        XCTAssertEqual(sut.assembleEmployeeTableViewController(didAddItemClosure: {}),
                       employeeListViewControllerAssembler.capturedEmployeeTableViewController)
    }
}

class UserAuthenticationViewControllerAssemblerSpy: UserAuthenticationViewControllerAssembler {
    
    var capturedUserAuthenticationViewController: UIViewController?
    
    override func assembleUserAuthenticationViewController(authenticationDidSucceed: @escaping () -> Void) -> UIViewController {
        capturedUserAuthenticationViewController = super.assembleUserAuthenticationViewController(authenticationDidSucceed: authenticationDidSucceed)
        return capturedUserAuthenticationViewController!
    }
}

class AddEmployeeViewControllerAssemblerSpy: AddEmployeeViewControllerAssembler {
    
    var capturedAddEmployeeViewController: UIViewController?
    
    override func assembleAddEmployeeViewController() -> UIViewController {
        capturedAddEmployeeViewController = super.assembleAddEmployeeViewController()
        return capturedAddEmployeeViewController!
    }
}

class EmployeeTableViewControllerAssemblerSpy: EmployeeTableViewControllerAssembler {
    
    var capturedEmployeeTableViewController: UIViewController?
    
    override func assembleEmployeeTableViewController(didAddItemClosure: @escaping () -> Void) -> UIViewController {
        capturedEmployeeTableViewController = super.assembleEmployeeTableViewController(didAddItemClosure: didAddItemClosure)
        return capturedEmployeeTableViewController!
    }
}


