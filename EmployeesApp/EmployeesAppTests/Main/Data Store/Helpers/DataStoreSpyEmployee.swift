//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class DataStoreSpyEmployee: DataStore<Employee> {
    
    var didAddItem = false
    var capturedEmployee: Employee?
    
    override func add(item: Employee) {
        didAddItem = true
        capturedEmployee = item
    }
    
}
