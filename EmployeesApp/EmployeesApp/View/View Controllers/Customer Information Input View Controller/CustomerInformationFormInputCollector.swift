//
//  Created by WebIQ Stagiaire on 19-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

struct EmployeeInformtion {
    var name: String
    var occupation: Occupation
    var emailAddress: String
}

class CustomerInformationFormInputCollector {
    
    private var employeeInformation: EmployeeInformtion?
    
    func collectFormInput(name: String, emailAddress: String, occupation: Occupation) {
        employeeInformation = EmployeeInformtion(name: name, occupation: occupation, emailAddress: emailAddress)
    }
    
    func getEmployeeInformation() -> EmployeeInformtion? {
        guard let employee = self.employeeInformation else {
           return EmployeeInformtion(name: "",
                           occupation: .Backend_Developer,
                           emailAddress: ""
            )
        }
        return employee
    }
}
