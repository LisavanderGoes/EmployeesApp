//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class EmployeeListLayoutTest: XCTestCase {
    
    var cellBuilder: EmployeeListLayoutCellBuilderSpy!
    var tableView: UITableView!
    var output: EmployeeListLayoutOutputSpy!
    
    override func setUp() {
        cellBuilder = EmployeeListLayoutCellBuilderSpy()
        tableView = UITableView()
        output = EmployeeListLayoutOutputSpy()
    }
    
    //MARK: Configure
    func test_configureSetsTableViewDataSourceToSelf() {
        let sut = makeSUT(makeDataSource())
        sut.configure(tableView)
        
        XCTAssertTrue(tableView.dataSource === sut)
    }
    
    func test_configuresSetsTableViewDelegateToSelf() {
        let sut = makeSUT(makeDataSource())
        sut.configure(tableView)
        
        XCTAssertTrue(tableView.delegate === sut)
    }
    
    
    //MARK: NumberOfRowsInSection
    func test_tableView_numberOfRowsInSection_withZeroEmployees() {
        let sut = makeSUT(makeDataSource(list: []))
        
        sut.configure(tableView)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_tableView_numberOfRowsInSection_withOneEmployee() {
        let sut = makeSUT(makeDataSource(list: [EmployeeMock(name: "", occupation: "", emailAddress: "")]))
        
        sut.configure(tableView)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
    }
    
    //MARK: CellForRowAt
    func test_tableView_cellForRowAt_cellFromBuilder() {
        let sut = makeSUT(makeDataSource())
        sut.configure(tableView)
        
        let returndedCell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cellBuilder.returnedCell)
        XCTAssertTrue(cellBuilder.returnedCell === returndedCell)
    }
    
    func test_tableView_cellFromRowAt_passesRightEmployeeToCellBuilder() {
        let employees = [makeEmployee(), makeEmployee()]
        let sut = makeSUT(makeDataSource(list: employees))
        sut.configure(tableView)
        
        employees.enumerated().forEach { (index, employee) in
            _ = sut.tableView(tableView, cellForRowAt: IndexPath(row: index, section: 0))
            XCTAssertEqual(cellBuilder.capturedEmployee, employee, "Failed for Index \(index)")
        }
    }
    
    func test_tableView_cellForRowAt_passesRightTableViewToCellBuilder() {
        let sut = makeSUT(makeDataSource())
        sut.configure(tableView)
        _ = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableView === cellBuilder.capturedTableView)
    }
    
    //MARK: DidSelectRowAt
    func test_tableView_didSelectRowAt_didSelectRow(){
        let sut = makeSUT(makeDataSource())
        sut.configure(tableView)
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(tableView, didSelectRowAt: indexPath)
        
        XCTAssertTrue(output.didSelectRowIsCalled)
    }
    
    func test_tableView_didSelectRowAt_didSelectRow_withRightEmployee(){
        let employees = [makeEmployee(), makeEmployee()]
        let sut = makeSUT(makeDataSource(list: employees))
        sut.configure(tableView)
        
        employees.enumerated().forEach { (index, employee) in
            let indexPath = IndexPath(row: 0, section: 0)
            sut.tableView(tableView, didSelectRowAt: indexPath)
            XCTAssertEqual(output.capturedEmployee, employee, "Failed for Index \(index)")
        }
    }
    
    //MARK: CommitEditingStyle
    func test_tableView_commitEditngStyle_removedItem() {
        let sut = makeSUT(makeDataSource())
        sut.configure(tableView)
        
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(tableView, commit: UITableViewCellEditingStyle.delete, forRowAt: indexPath)
        XCTAssertTrue(output.removeItemIsCalled)
    }
    
    func test_tableView_commitEditStyle_removeItem_withRightIndex() {
        let sut = makeSUT(makeDataSource())
        sut.configure(tableView)
        
        let indexPath = IndexPath(row: 2, section: 0)
        sut.tableView(tableView, commit: UITableViewCellEditingStyle.delete, forRowAt: indexPath)
        XCTAssertEqual(output.capturedIndexRow, indexPath.row)
    }
    
    //MARK: Helpers
    private func makeSUT(_ dataSource: EmployeeListDataSourceSpy) -> EmployeeListLayout<EmployeeListLayoutOutputSpy, EmployeeListDataSourceSpy> {
        return EmployeeListLayout(
            employeeListDataSource: dataSource,
            cellBuilder: cellBuilder, output: output
        )
    }
    
    func makeEmployee(name: String = "", occupation: String = "", emailAddress: String = "") -> EmployeeMock {
        return EmployeeMock(name: name, occupation: "Backend_Developer", emailAddress: emailAddress)
    }
    
    private func makeDataSource(list: [EmployeeMock] = [EmployeeMock(name: "", occupation: "", emailAddress: "")]) -> EmployeeListDataSourceSpy {
        return EmployeeListDataSourceSpy(employeeList: list)
    }
}
