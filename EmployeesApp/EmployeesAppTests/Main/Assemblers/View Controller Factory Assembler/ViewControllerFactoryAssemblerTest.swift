//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class ViewControllerFactoryAssemblerTest: XCTestCase {
    
    var sut: ViewControllerFactoryAssembler!
    var dependencyfactory: ViewControllerFactoryAssemblerDependencyFactorySpy!

    override func setUp() {
        let authenticationService = AuthenticationServiceSpy()
        let dataStore = DataStore<Employee>()
        dependencyfactory = ViewControllerFactoryAssemblerDependencyFactorySpy(authenticationService: authenticationService, dataStore: dataStore)
        sut = ViewControllerFactoryAssembler(dependencyFactory: dependencyfactory)
    }

    func test_assembleViewControllerFactory_returnCorrectViewControllerFactory() {
        XCTAssertTrue(sut.assembleViewControllerFactory() === dependencyfactory.capturedViewControllerFactory)
    }
}

