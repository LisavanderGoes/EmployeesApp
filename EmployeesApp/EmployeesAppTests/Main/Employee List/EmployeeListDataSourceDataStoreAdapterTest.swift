//
//  Created by WebIQ Stagiaire on 17-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeListDataSourceDataStoreAdapterTest: XCTestCase {
    
    func test_getEmployee() {
        let list = [EmployeeMock(name: "", occupation: "", emailAddress: "")]
        let sut = EmployeeListDataSourceDataStoreAdapter(dataStore: DataStore(list: list, output: DataStoreOutputSpy()))
        XCTAssertEqual(sut.getEmployee(forRow: 0), list[0])
    }
    
    func test_getEmployee_withRightIndex() {
        let list = [EmployeeMock(name: "", occupation: "", emailAddress: ""),
                    EmployeeMock(name: "2", occupation: "2", emailAddress: "2")]
        let sut = EmployeeListDataSourceDataStoreAdapter(dataStore: DataStore(list: list, output: DataStoreOutputSpy()))
        XCTAssertEqual(sut.getEmployee(forRow: 1), list[1])
    }
    
    func test_getEmployeeCount() {
        let list = [EmployeeMock(name: "", occupation: "", emailAddress: "")]
        let sut = EmployeeListDataSourceDataStoreAdapter(dataStore: DataStore(list: list, output: DataStoreOutputSpy()))
        XCTAssertEqual(sut.getEmployeeCount(), list.count)
    }
}
