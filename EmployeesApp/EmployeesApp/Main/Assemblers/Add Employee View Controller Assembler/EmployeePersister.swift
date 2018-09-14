//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeePersister {
    
    let inputCollector: EmployeeInformationInputCollector
    let converter: EmployeeInformationConverter
    let dataStore: DataStore<Employee>
    
    init(
        inputCollector: EmployeeInformationInputCollector,
        converter: EmployeeInformationConverter,
        dataStore: DataStore<Employee>
    ) {
        self.inputCollector = inputCollector
        self.converter = converter
        self.dataStore = dataStore
    }
    
    func persist() {
        guard
            let collectedInputValues = inputCollector.getCollectedInputInformation(),
            let convertedEmployee = converter.createEmployee(fromEmployeeInformation: collectedInputValues)
            else {
                return
        }
        dataStore.add(item: convertedEmployee, atIndex: 0)
    }
}
