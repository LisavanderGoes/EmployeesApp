//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeInformationConverter {
    
    func createEmployee(fromEmployeeInformation employeeInformation: EmployeeInformation) -> Employee? {
        guard
            let name = employeeInformation.name,
            let emailAddress = employeeInformation.emailAddress,
            let _ = employeeInformation.ocupation
        else { return nil }
        return Employee(
            name: name,
            occupationCase: .backendDeveloper,
            emailAddress: emailAddress
        )
    }
}
