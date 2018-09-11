//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
import UIKit
@testable import EmployeesApp

class EmployeeCellTest: XCTestCase {
    
    let sut: EmployeeCell = makeSUT()
    
    func test_nameOutletIsConnected() {
        XCTAssertNotNil(sut.nameLabel)
    }
    
    func test_occupationOutletIsConnected() {
        XCTAssertNotNil(sut.occupationLabel)
    }
    
    func test_emailAddressIsConnected() {
        XCTAssertNotNil(sut.emailAddressLabel)
    }
    
    func test_setName_setsNameLabel() {
        let name = "name"
        sut.set(name: name)
        
        XCTAssertEqual(sut.nameLabel.text, name)
    }
    
    func test_setOccupation_setsOccupationLabel() {
        let occupation = "occupation"
        sut.set(occupation: occupation)
        
        XCTAssertEqual(sut.occupationLabel.text, occupation)
    }
    
    func test_setEmailAddress_setsEmailAddressLabel() {
        let emailAddress = "email"
        sut.set(emailAddress: emailAddress)
        
        XCTAssertEqual(sut.emailAddressLabel.text, emailAddress)
    }
}

private func makeSUT() -> EmployeeCell {
    let bundle = Bundle(for: EmployeeCell.self)
    let sut = bundle.loadNibNamed(
        "EmployeeCell",
        owner: nil,
        options: nil
        )![0] as! EmployeeCell
    return sut
}
