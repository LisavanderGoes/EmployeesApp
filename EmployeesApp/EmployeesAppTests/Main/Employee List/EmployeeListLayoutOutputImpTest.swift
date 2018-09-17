//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeListLayoutOutputImpTest: XCTestCase {
    
    var sut: EmployeeListLayoutOutputImp<EmployeeMock>!
    var selectionControllerSpy: SelectionControllerSpy!
    var dataStoreSpy: DataStoreSpy!
    
    override func setUp() {
        let list = [EmployeeMock(name: "", occupation: "", emailAddress: "")]
        selectionControllerSpy = SelectionControllerSpy()
        dataStoreSpy = DataStoreSpy(list: list, output: DataStoreOutputSpy())
        sut = EmployeeListLayoutOutputImp(
            selectionController: selectionControllerSpy,
            dataStore: dataStoreSpy
        )
    }
    
    func test_didSelectRow() {
        sut.didSelectRow(employee: EmployeeMock(name: "", occupation: "", emailAddress: ""))
        XCTAssertTrue(selectionControllerSpy.didSelectRow)
    }
    
    func test_didSelectRow_withRightEmployee() {
        let employee = EmployeeMock(name: "", occupation: "", emailAddress: "")
        sut.didSelectRow(employee: employee)
        XCTAssertEqual(selectionControllerSpy.capturedEmployee, employee)
    }
    
    func test_removeItem() {
        sut.removeItem(at: 0)
        XCTAssertTrue(dataStoreSpy.didRemoveItem)
    }
    
    func test_removeItem_withRightIndex() {
        sut.removeItem(at: 1)
        XCTAssertEqual(dataStoreSpy.capturedIndex, 1)
    }
}

class SelectionControllerSpy: EmployeeSelectionController {
    
    var didSelectRow = false
    var capturedEmployee: EmployeeMock?
    
    override func didSelectRow(employee: PresentableEmployee) {
        didSelectRow = true
        capturedEmployee = employee as? EmployeeMock
    }
}

class DataStoreSpy: DataStore<EmployeeMock> {
    
    var didRemoveItem = false
    var capturedIndex: Int?
    
    override func removeItemAt(index: Int) {
        didRemoveItem = true
        capturedIndex = index
    }
}
