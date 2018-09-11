//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class TableViewControllerTest: XCTestCase{
    
    var sut: TableViewController!
    var tableViewLayoutSpy: TableViewLayoutSpy!
    
    override func setUp() {
        tableViewLayoutSpy = TableViewLayoutSpy()
        sut = TableViewController(layout: tableViewLayoutSpy)
        _ = sut.view
    }
    
    func test_viewDidLoad_tableViewIsConnected() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_viewDidLoad_configuresLayout() {
        XCTAssertTrue(tableViewLayoutSpy.configureIsCalled)
    }
    
    func test_viewDidLoad_capturedTableView() {
        XCTAssertEqual(tableViewLayoutSpy.capturedTableView, sut.tableView)
    }
    
}
