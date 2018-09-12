//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class EmployeeListLayoutCellBuilderTest: XCTestCase {
    
    var sut: EmployeeListLayout.CellBuilder!
    var tableView: UITableView!
    
    override func setUp() {
        sut = EmployeeListLayout.CellBuilder()
        tableView = UITableView()
        
        let bundel = Bundle(for: EmployeeCell.self)
        let nib = UINib(nibName: "EmployeeCell", bundle: bundel)
        tableView.register(nib, forCellReuseIdentifier: "EmployeeCell")
    }
    
    func test_makeCell_setName() {
        let name = "name"
        let employeeSpy = makeEmployee(name: name)
        let returnedCell = sut.makeCell(for: employeeSpy, for: tableView)
        
        XCTAssertEqual(returnedCell.nameLabel.text, name)
    }
    
    func test_makeCell_setOccupation() {
        let occupation = Occupation.Backend_Developer
        let employeeSpy = makeEmployee(occupation: occupation)
        let returnedCell = sut.makeCell(for: employeeSpy, for: tableView)
        
        XCTAssertEqual(returnedCell.occupationLabel.text, occupation.rawValue)
    }
    
    func test_makeCell_setEmailAddress() {
        let emailAddress = "emailAddress"
        let employeeSpy = makeEmployee(emailAddress: emailAddress)
        let returnedCell = sut.makeCell(for: employeeSpy, for: tableView)
        
        XCTAssertEqual(returnedCell.emailAddressLabel.text, emailAddress)
    }
    
    //MARK: Helpers
    func makeEmployee(name: String = "", occupation: Occupation = Occupation.Backend_Developer, emailAddress: String = "") -> Employee {
        return Employee(name: name, occupationCase: occupation, emailAddress: emailAddress)
    }
}
