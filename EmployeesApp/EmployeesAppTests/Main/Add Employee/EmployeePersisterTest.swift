//
//  Created by WebIQ Stagiaire on 20-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeePersisterTest: XCTestCase {
    
    var dataStore: DataStoreSpyEmployee!
    var formInputCollector: CustomerInformationFormInputCollector!
    var converter: EmployeeInformationConverter!
    var sut: EmployeePersister!
    var employeeName: String!
    var emailAddress: String!
    var occupation: Occupation!
    
    override func setUp() {
        dataStore = DataStoreSpyEmployee()
        
        employeeName = "name"
        emailAddress = "email"
        occupation = Occupation.Frontend_Developer
        
        formInputCollector = CustomerInformationFormInputCollector()
        
        formInputCollector.collectFormInput(name: employeeName, emailAddress: emailAddress, occupation: occupation)
        
        converter = EmployeeInformationConverter()
        sut = EmployeePersister(converter: converter, dataStore: dataStore)
        
    }
    
    func test_persist_didAddItem() {
        sut.persist(formInputCollector: formInputCollector)
        XCTAssertTrue(dataStore.didAddItem)
    }
    
    func test_persist_didAddItem_withCorrectEmployee() {
        
        sut.persist(formInputCollector: formInputCollector)
        let capturedEmployee = dataStore.capturedEmployee!
        
        XCTAssertEqual(capturedEmployee.name, employeeName)
        
        XCTAssertTrue(capturedEmployee.name == employeeName && capturedEmployee.emailAddress == emailAddress && capturedEmployee.occupationCase == occupation)    }
}
