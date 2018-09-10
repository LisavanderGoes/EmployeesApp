//
//  Created by WebIQ Stagiaire on 10-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import XCTest
@testable import EmployeesApp

class EmployeesViewControllerTest: XCTestCase {
    
    var sut: EmployeesViewController!
    var viewControllerSpy: EmployeesViewControllerSpy!
    
    override func setUp() {
        sut = EmployeesViewController()
        _ = sut.view
        
        viewControllerSpy = EmployeesViewControllerSpy()
    }
    
    func test_viewDidLoad_connectEmployeesTableView() {
        XCTAssertNotNil(sut.employeesTableView)
    }
    
    func test_tableView_numberOfRowsInSection() {
        let numberOfRowsInSection = sut.tableView(sut.employeesTableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRowsInSection, 0)
    }
    
    func test_tableView_numberOfRowsInSection_withOneEmployee_returnOne() {
        
        let employeesList = ["One employee"]
        
        sut.employeesList = employeesList
        
        let numberOfRowsInSection = sut.tableView(sut.employeesTableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRowsInSection, employeesList.count)
    }
    
    func test_tableView_numberOfRowsInSection_withTwoEmployee_returnTwo() {
        
        let employeesList = ["One employee", "Another employee"]
        
        sut.employeesList = employeesList
        
        let numberOfRowsInSection = sut.tableView(sut.employeesTableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRowsInSection, employeesList.count)
    }
}
