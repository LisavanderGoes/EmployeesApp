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
    
    func test_getEmployee() {
        let name = "name"
        let emailAddress = "email"
        let occupation = Occupation.Frontend_Developer
        
        sut.collectFormInput(name: name, emailAddress: emailAddress, occupation: occupation)
        
        let employee = sut.getEmployee()
        
        XCTAssertTrue(employee.name == name && employee.emailAddress == emailAddress && employee.occupationCase == occupation)
    }
}
