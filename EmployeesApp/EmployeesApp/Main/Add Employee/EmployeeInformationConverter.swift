//
//  Created by WebIQ Stagiaire on 20-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeInformationConverter {
    
    func convertEmployee(employeeInformation: EmployeeInformtion) -> Employee? {
        return Employee(name: employeeInformation.name,
                        occupationCase: employeeInformation.occupation,
                        emailAddress: employeeInformation.emailAddress)
    }
}
