//
//  Created by WebIQ Stagiaire on 13-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

struct EmployeeMock: PresentableEmployee, Equatable {
    
    var name: String
    
    var occupation: String
    
    var emailAddress: String
    
    public static func ==(lhs: EmployeeMock, rhs: EmployeeMock) -> Bool {
        return lhs.name == rhs.name && lhs.occupation == rhs.occupation && lhs.emailAddress == rhs.emailAddress
    }
}
