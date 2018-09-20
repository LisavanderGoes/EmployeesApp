//
//  Created by WebIQ Stagiaire on 19-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class CustomerInformationFormInputCollectorTest: XCTestCase {
    var sut: CustomerInformationFormInputCollector!
    
    override func setUp() {
        sut = CustomerInformationFormInputCollector()
    }
    
    func test_getEmployeeInformation() {
        let name = "name"
        let emailAddress = "email"
        let occupation = Occupation.Frontend_Developer
        
        sut.collectFormInput(name: name, emailAddress: emailAddress, occupation: occupation)
        
        let employeeInformation = sut.getEmployeeInformation()
        
        XCTAssertTrue(employeeInformation?.name == name && employeeInformation?.emailAddress == emailAddress && employeeInformation?.occupation == occupation)
    }
}
