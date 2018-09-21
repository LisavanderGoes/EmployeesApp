//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class DataStoreSpyEmployeeMock: DataStore<EmployeeMock> {
    
    var didRemoveItem = false
    var capturedIndex: Int?
    
    override func removeItemAt(index: Int) {
        didRemoveItem = true
        capturedIndex = index
    }
}
