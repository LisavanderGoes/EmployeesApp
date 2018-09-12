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
    
    func test_configureSetsTableViewDataSourceToSelf() {
        let sut = makeSUT()
        sut.configure(tableView)
        
        XCTAssertTrue(tableView.dataSource === sut)
    }
    
    func test_tableView_numberOfRowsInSection_withOneEmployee() {
        let employeeList = [PresentableEmployeeSpy()]
        let sut = makeSUT(list: employeeList)
        
        sut.configure(tableView)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_tableView_cellForRowAt_cellFromBuilder() {
        let sut = makeSUT()
        sut.configure(tableView)
        
        let returndedCell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cellBuilder.returnedCell)
        XCTAssertTrue(cellBuilder.returnedCell === returndedCell)
    }
    
    func test_tableView_cellFromRowAt_passesRightEmployeeToCellBuilder() {
        let employees = [PresentableEmployeeSpy(), PresentableEmployeeSpy()]
        let sut = makeSUT(list: employees)
        sut.configure(tableView)
        
        employees.enumerated().forEach { (index, employee) in
            _ = sut.tableView(tableView, cellForRowAt: IndexPath(row: index, section: 0))
            XCTAssertEqual(cellBuilder.capturedEmployee as! PresentableEmployeeSpy, employee, "Failed for Index \(index)")
        }
    }
    
    func test_tableView_cellForRowAt_passesRightTableViewToCellBuilder() {
        let sut = makeSUT()
        sut.configure(tableView)
        _ = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableView === cellBuilder.capturedTableView)
    }
    
    func test_configuresSetsTableViewDelegateToSelf() {
        let sut = makeSUT()
        sut.configure(tableView)
        
        XCTAssertTrue(tableView.delegate === sut)
    }
    
    func test_tableView_didSelectRowAt_didSelectRow(){
        let employees = [PresentableEmployeeSpy()]
        let sut = makeSUT(list: employees)
        sut.configure(tableView)
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(tableView, didSelectRowAt: indexPath)
        
        XCTAssertTrue(output.didSelectRowIsCalled)
    }
    
    func test_tableView_didSelectRowAt_didSelectRow_withRightEmployee(){
        let employees = [PresentableEmployeeSpy(), PresentableEmployeeSpy()]
        let sut = makeSUT(list: employees)
        sut.configure(tableView)
        
        employees.enumerated().forEach { (index, employee) in
            let indexPath = IndexPath(row: 0, section: 0)
            sut.tableView(tableView, didSelectRowAt: indexPath)
            XCTAssertEqual(output.capturedEmployee as! PresentableEmployeeSpy, employee, "Failed for Index \(index)")
        }
    }
    
    //MARK: Helpers
    private func makeSUT(
        list: [PresentableEmployee] = [PresentableEmployeeSpy()]
    ) -> EmployeeListLayout {
        return EmployeeListLayout(
            employeeList: list,
            cellBuilder: cellBuilder, output: output
        )
    }
}
