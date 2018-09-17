//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeListLayoutOutputImp<EmployeeType: PresentableEmployee>: EmployeeListLayoutOutput {
    
    var selectionController: EmployeeSelectionController!
    var dataStore: DataStore<EmployeeType>!
    
    init(selectionController: EmployeeSelectionController, dataStore: DataStore<EmployeeType>) {
        self.selectionController = selectionController
        self.dataStore = dataStore
    }
    
    func didSelectRow(employee: EmployeeType) {
        selectionController.didSelectRow(employee: employee)
    }
    
    func removeItem(at index: Int) {
        dataStore.removeItemAt(index: index)
    }
}
