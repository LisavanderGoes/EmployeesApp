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
        let employeeSpy = PresentableEmployeeSpy(name: name)
        let returnedCell = sut.makeCell(for: employeeSpy, for: tableView)
        
        XCTAssertEqual(returnedCell.nameLabel.text, name)
    }
    
    func test_makeCell_setOccupation() {
        let occupation = "occupation"
        let employeeSpy = PresentableEmployeeSpy(occupation: occupation)
        let returnedCell = sut.makeCell(for: employeeSpy, for: tableView)
        
        XCTAssertEqual(returnedCell.occupationLabel.text, occupation)
    }
    
    func test_makeCell_setEmailAddress() {
        let emailAddress = "emailAddress"
        let employeeSpy = PresentableEmployeeSpy(emailAddress: emailAddress)
        let returnedCell = sut.makeCell(for: employeeSpy, for: tableView)
        
        XCTAssertEqual(returnedCell.emailAddressLabel.text, emailAddress)
    }

}
