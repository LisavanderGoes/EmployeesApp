//
//  Created by WebIQ Stagiaire on 17-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class DataStoreOutputSpy: DataStoreOutput {
    
    var didRemoveItem = false
    var capturedIndex: Int?
    
    func didRemoveItem(at index: Int) {
        didRemoveItem = true
        capturedIndex = index
    }
    
    var didAddItem = false
    var capturedItem: String?
    
    func didAdd(item: Any) {
        didAddItem = true
        capturedItem = item as? String
    }
}
