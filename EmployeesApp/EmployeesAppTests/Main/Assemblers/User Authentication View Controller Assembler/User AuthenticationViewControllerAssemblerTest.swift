//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

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
        XCTAssertTrue(sut.assembleUserAuthenticationViewController(authenticationDidSucceed: { }) === dependencyFactory.returnedViewController)
    }
    
    func test_assembleUserAuthenticationViewController_connectsViewControllerToUseCase() {
        _ = sut.assembleUserAuthenticationViewController(authenticationDidSucceed: { })
        dependencyFactory.returnedViewController?.loginClosure?("", "")
        XCTAssertTrue(dependencyFactory.returnedUseCase?.authenticateUserIsCalled ?? false)
    }
    
    func test_assembleUserAuthenticationViewController_presenterWeakRefToViewController() {
        _ = sut.assembleUserAuthenticationViewController(authenticationDidSucceed: { })
        weak var weakRefferenceToViewController = dependencyFactory.returnedViewController
        dependencyFactory.returnedViewController = nil
        XCTAssertNil(weakRefferenceToViewController)
    }
}
