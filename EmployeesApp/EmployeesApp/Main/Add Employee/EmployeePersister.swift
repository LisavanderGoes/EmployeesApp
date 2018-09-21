//
//  Created by WebIQ Stagiaire on 20-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeePersister {
    
    private let converter: EmployeeInformationConverter
    private let dataStore: DataStore<Employee>
    
    
    init(converter: EmployeeInformationConverter,
         dataStore: DataStore<Employee>) {
        self.converter = converter
        self.dataStore = dataStore
    }
    
    func persist(formInputCollector: CustomerInformationFormInputCollector) {
        guard
            let collectedEmployeeInformation = formInputCollector.getEmployeeInformation(),
            let convertedEmployee = converter.convertEmployee(employeeInformation: collectedEmployeeInformation)
        else {
            return
        }
        dataStore.add(item: convertedEmployee)
    }
}
