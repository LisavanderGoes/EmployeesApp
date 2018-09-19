//
//  Created by WebIQ Stagiaire on 19-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class CustomerInformationFormInputCollector {
    
    var employee: Employee?
    
    func collectFormInput(name: String, emailAddress: String, occupation: Occupation) {
        employee = Employee(name: name, occupationCase: occupation, emailAddress: emailAddress)
    }
    
    func getEmployee() -> Employee {
        guard let employee = self.employee else {
           return Employee(name: "",
                           occupationCase: .Backend_Developer,
                           emailAddress: ""
            )
        }
        return employee
    }
}
