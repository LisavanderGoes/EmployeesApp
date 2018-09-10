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
    
//    func test_tableView_cellForAt_() {
//        let cell = sut.employeesTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? EmployeeTableViewCell
//
//        XCTAssertNotNil(cell)
//    }
    
    //MARK: Helpers
    
    func makeSUT(_ list: [String] = []) -> EmployeesViewController {
        sut = EmployeesViewController(employeesList: list)
        _ = sut.view
        return sut
    }
}
