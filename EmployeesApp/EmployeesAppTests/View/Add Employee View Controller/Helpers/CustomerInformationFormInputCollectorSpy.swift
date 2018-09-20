//
//  Created by WebIQ Stagiaire on 20-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

class CustomerInformationFormInputCollectorSpy: CustomerInformationFormInputCollector {
    
    var collectFormInputIsCalled = false
    var capturedName: String?
    var capturedEmailAddress: String?
    var capturedOccuption: Occupation?
    
    override func collectFormInput(name: String, emailAddress: String, occupation: Occupation) {
        collectFormInputIsCalled = true
        self.capturedName = name
        self.capturedEmailAddress = emailAddress
        self.capturedOccuption = occupation
    }
}
