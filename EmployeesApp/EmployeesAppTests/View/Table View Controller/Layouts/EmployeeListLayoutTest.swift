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
    
    override func setUp() {
        cellBuilder = EmployeeListLayoutCellBuilderSpy()
        tableView = UITableView()
    }
    
    func test_configureSetsTableViewDataSourceToSelf() {
        let sut = makeSUT()
        sut.configure(tableView)
        
        XCTAssertTrue(tableView.dataSource === sut)
    }
    
    func test_tableView_numberOfRowsInSection() {
        let employeeList = [EmployeeSpy()]
        let sut = makeSUT(list: employeeList)
        
        sut.configure(tableView)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_tableView_cellForRowAt_cellFromBuilder() {
        let sut = makeSUT()
        
        let returndedCell = sut.tableView(UITableView(), cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cellBuilder.returnedCell)
        XCTAssertTrue(cellBuilder.returnedCell === returndedCell)
    }
    
    //MARK: Helpers
    
    private func makeSUT(
        list: [PresentableEmployee] = [EmployeeSpy()]
    ) -> EmployeeListLayout {
        return EmployeeListLayout(
            employeeList: list,
            cellBuilder: cellBuilder
        )
    }
}

struct EmployeeSpy: PresentableEmployee {
    
}
