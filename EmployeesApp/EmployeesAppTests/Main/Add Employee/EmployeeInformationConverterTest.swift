//
//  Created by WebIQ Stagiaire on 20-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeInformationConverterTest: XCTestCase {
    
    func test_convertEmployee() {
        let sut = EmployeeInformationConverter()
        let employeeInformation = EmployeeInformtion(name: "name", occupation: Occupation.iOS_Developer, emailAddress: "email")
        
        let returnedEmployee = sut.convertEmployee(employeeInformation: employeeInformation)
        
        XCTAssertTrue(employeeInformation.name == returnedEmployee?.name && employeeInformation.emailAddress == returnedEmployee?.emailAddress && employeeInformation.occupation == returnedEmployee?.occupationCase)
    }
}
