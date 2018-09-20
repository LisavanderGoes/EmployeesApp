//
//  Created by WebIQ Stagiaire on 20-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeePersister {
    
    var formInputCollector: CustomerInformationFormInputCollector
    var converter: EmployeeInformationConverter
    var dataStore: DataStore<Employee>
    
    
    init(formInputCollector: CustomerInformationFormInputCollector,
         converter: EmployeeInformationConverter,
         dataStore: DataStore<Employee>) {
        self.formInputCollector = formInputCollector
        self.converter = converter
        self.dataStore = dataStore
    }
    
    func persist() {
        guard
            let collectedEmployeeInformation = formInputCollector.getEmployeeInformation(),
            let convertedEmployee = converter.convertEmployee(employeeInformation: collectedEmployeeInformation)
        else {
            return
        }
        dataStore.add(item: convertedEmployee)
    }
}
