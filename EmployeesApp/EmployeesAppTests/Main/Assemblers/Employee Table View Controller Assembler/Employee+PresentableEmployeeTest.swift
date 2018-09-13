//
//  Created by WebIQ Stagiaire on 13-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class Employee_PresentableEmployeeTest: XCTestCase {
    
    func test_occuption_returnsString() {
        let occupationCase = Occupation.Backend_Developer
        let sut = Employee(name: "", occupationCase: occupationCase, emailAddress: "")
        let occupation = occupationCase.rawValue
        XCTAssertEqual(sut.occupation, occupation)
    }
}
