//
//  Created by WebIQ Stagiaire on 10-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class EmployeesViewControllerTest: XCTestCase {
    
    var sut: EmployeesViewController!
    
    func test_viewDidLoad_connectEmployeesTableView() {
        XCTAssertNotNil(makeSUT().tableView)
    }
    
    func test_tableView_numberOfRowsInSection() {
        XCTAssertEqual(makeSUT().tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(["E1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(["E1", "E2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_tableView_cellForAt_firstItem() {
        let cell = makeSUT(["E1"]).tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))

        XCTAssertEqual(cell?.textLabel?.text, "E1")
    }
    
    func test_tableView_cellForAt_secondItem() {
        let cell = makeSUT(["E1", "E2"]).tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 0))
        
        XCTAssertEqual(cell?.textLabel?.text, "E2")
    }
    
    
    //MARK: Helpers
    
    func makeSUT(_ list: [String] = []) -> EmployeesViewController {
        sut = EmployeesViewController(employeesList: list)
        _ = sut.view
        return sut
    }
}
