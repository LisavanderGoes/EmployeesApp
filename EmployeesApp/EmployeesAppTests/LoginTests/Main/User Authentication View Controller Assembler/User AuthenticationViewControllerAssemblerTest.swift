//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class UserAuthenticationViewControllerAssemblerTest: XCTestCase {
    
    func test_assembleUserAuthenticationViewController() {
        let dependencyFactory = UserAuthenticationViewControllerAssemblerDependencyFactorySpy()
        let sut = UserAuthenticationViewControllerAssembler(
            dependencyFactory: dependencyFactory
        )
        XCTAssertTrue(sut.assembleUserAuthenticationViewController() === dependencyFactory.returnedViewController)
    }
}

import UIKit
class UserAuthenticationViewControllerAssemblerDependencyFactorySpy: UserAuthenticationViewControllerAssembler.DependencyFactory {
    
    var returnedViewController: LoginViewController?
    
    override func makeViewController() -> LoginViewController {
        returnedViewController = super.makeViewController()
        return returnedViewController!
    }
}
