
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class UserAuthenticationUseCaseTest : XCTestCase {
    
    var service: AuthenticationServiceSpy!
    var output: UserAuthenticationUseCaseOutputSpy!
    var sut: UserAuthenticationUseCase!
    
    override func setUp() {
        service = AuthenticationServiceSpy()
        output = UserAuthenticationUseCaseOutputSpy()
        sut = UserAuthenticationUseCase(
            service: service,
            output: output
        )
    }
    
    func test_authenticateUser_executesServiceAuthenticateUser() {
        authenticateUser()
        XCTAssertTrue(service.authenticateUserCalled)
    }
    
    func test_authenticateUser_passesUsernameToService() {
        let username = "Lisa"
        authenticateUser(username: username)
        XCTAssertEqual(username, service.capturedUsername)
    }
    
    func test_authenticateUser_passesPasswordToService() {
        let password = "password"
        authenticateUser(password: password)
        XCTAssertEqual(password, service.capturedPassword)
    }
    
    func test_authenticateUser_notifiesOutputWhenAuthenticationSucceeds() {
        authenticateUser()
        service.capturedSuccessClosure?()
        XCTAssertTrue(output.authenticationSuccededCalled)
    }
    
    func test_authenticateUser_notifiesOutputWhenAuthenticationFails() {
        authenticateUser()
        service.capturedFailureClosure?("")
        XCTAssertTrue(output.authenticationFailedCalled)
    }
    
    func test_authenticateUser_passesFailureReasonToOutput() {
        authenticateUser()
        let reason = "just a random reason"
        service.capturedFailureClosure?(reason)
        XCTAssertEqual(reason, output.capturedReason)
    }
    
    func test_deinit_cancelsOngoingAuthenticationTask() {
        authenticateUser()
        let task = service.returnedAuthenticationTask
        sut = nil
        XCTAssertTrue(task?.canceled ?? false)
    }
    
    func test_authenticateUserTwice_ignoresRequestWhenStillOngoing() {
        authenticateUser()
        service.authenticateUserCalled = false
        authenticateUser()
        XCTAssertFalse(service.authenticateUserCalled)
    }
    
    func test_authenticateUser_removesReferenceWhenAuthenticationSuceeds() {
        authenticateUser()
        weak var ongoingTask = service.returnedAuthenticationTask
        service.returnedAuthenticationTask = nil
        XCTAssertNotNil(ongoingTask)
        service.capturedSuccessClosure?()
        XCTAssertNil(ongoingTask)
    }
    
    func test_authenticateUser_removeReferenceWhenAuthenticationFails() {
        authenticateUser()
        weak var ongoingTask = service.returnedAuthenticationTask
        service.returnedAuthenticationTask = nil
        XCTAssertNotNil(ongoingTask)
        service.capturedFailureClosure?("")
        XCTAssertNil(ongoingTask)
    }
    
    func test_authenticateUser_notifiesOutputWhenAuthenticationStarted() {
        authenticateUser()
        XCTAssertTrue(output.authenticationStartedIsCalled)
    }
    
    func test_authenticateUser_doesNotNotifyOutpuAboutAuthenticationStartedWhenStillOngoing() {
        authenticateUser()
        XCTAssertTrue(output.authenticationStartedIsCalled)
        output.authenticationStartedIsCalled = false
        authenticateUser()
        XCTAssertFalse(output.authenticationStartedIsCalled)
    }
    
    // MARK: Helpers
    private func authenticateUser(
        username: String = "",
        password: String = ""
    ) {
        sut.authenticateUser(
            username: username,
            password: password
        )
    }
}
