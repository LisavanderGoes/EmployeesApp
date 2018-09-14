//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeInformationInputCollector {
    
    private var collectedInputInformation: EmployeeInformation?
    
    func collect(employeeInformationInput: EmployeeInformation) {
        collectedInputInformation = employeeInformationInput
    }
    
    func getCollectedInputInformation() -> EmployeeInformation? {
        return collectedInputInformation
    }
}
