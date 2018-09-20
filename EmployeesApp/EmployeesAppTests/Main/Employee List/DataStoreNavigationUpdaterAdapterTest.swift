//
//  Created by WebIQ Stagiaire on 20-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class DataStoreNavigationUpdaterAdapterTest: XCTestCase {
    
    func test_didAddItem() {
        var didAddItem = false
        let closure = {
            didAddItem = true
        }
        let sut = DataStoreNavigationUpdaterAdapter(didAddItemClosure: closure)
        sut.didAdd(at: 0)
        XCTAssertTrue(didAddItem)
    }
}
