//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class UserAuthenticationViewControllerAssemblerTest: XCTestCase {
    
    var dependencyFactory: UserAuthenticationViewControllerAssemblerDependencyFactorySpy!
    var sut: UserAuthenticationViewControllerAssembler!
    
    override func setUp() {
        dependencyFactory = UserAuthenticationViewControllerAssemblerDependencyFactorySpy(
            service: AuthenticationServiceSpy()
        )
        sut = UserAuthenticationViewControllerAssembler(dependencyFactory: dependencyFactory)
    }
    
    func test_assembleUserAuthenticationViewController_returnsViewControllerRecievedFromDependencyFactory() {
        XCTAssertTrue(sut.assembleUserAuthenticationViewController() === dependencyFactory.returnedViewController)
    }
    
    func test_assembleUserAuthenticationViewController_connectsViewControllerToUseCase() {
        _ = sut.assembleUserAuthenticationViewController()
        dependencyFactory.returnedViewController?.loginClosure?("", "")
        XCTAssertTrue(dependencyFactory.returnedUseCase?.authenticateUserIsCalled ?? false)
    }
    
    func test_assembleUserAuthenticationViewController_presenterWeakRefToViewController() {
        _ = sut.assembleUserAuthenticationViewController()
        weak var weakRefferenceToViewController = dependencyFactory.returnedViewController
        dependencyFactory.returnedViewController = nil
        XCTAssertNil(weakRefferenceToViewController)
    }
}

import UIKit
class UserAuthenticationViewControllerAssemblerDependencyFactorySpy: UserAuthenticationViewControllerAssembler.DependencyFactory {
    
    var returnedViewController: LoginViewController?
    
    override func makeViewController() -> LoginViewController {
        returnedViewController = super.makeViewController()
        return returnedViewController!
    }
    
    var returnedUseCase: UserAuthenticationUseCaseSpy?
    
    override func makeUseCase(
        output: UserAuthenticationPresenter
    ) -> UserAuthenticationUseCase {
        returnedUseCase = UserAuthenticationUseCaseSpy(
            service: AuthenticationServiceSpy(),
            output: UserAuthenticationUseCaseOutputSpy()
        )
        return returnedUseCase!
    }
}

class UserAuthenticationUseCaseSpy: UserAuthenticationUseCase {
    
    var authenticateUserIsCalled = false
    
    override func authenticateUser(username: String, password: String) {
        authenticateUserIsCalled = true
    }
}
