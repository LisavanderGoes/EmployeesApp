//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class WeakRefTest: XCTestCase {
    
    func test_holdsWeakReferenceToObject() {
        var object: Object? = Object()
        let sut = WeakRef(object!)
        weak var weakReferenceToObject = object
        XCTAssertNotNil(weakReferenceToObject)
        object = nil
        XCTAssertNil(weakReferenceToObject)
    }
}

class Object {}
