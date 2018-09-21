//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class BarButtonItemTest: XCTestCase {
    
    func test_targetIsSelf() {
        let sut = BarButtonItem()
        sut.tabActionClosure = {}
        XCTAssertTrue(sut.target === sut)
    }
    
    func test_barButtonItem_isTapped() {
        let sut = BarButtonItem()
        var tabActionClosureIsCalled = false
        sut.tabActionClosure = {
            tabActionClosureIsCalled = true
        }
        sut.perform(sut.action)
        XCTAssertTrue(tabActionClosureIsCalled)
    }
}
