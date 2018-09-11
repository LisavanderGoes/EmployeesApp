//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
@testable import EmployeesApp

struct PresentableEmployeeSpy: PresentableEmployee, Equatable {
    let name: String
    let occupation: String
    let emailAddress: String
    
    init(name: String = "", occupation: String = "", emailAddress: String = "") {
        self.name = name
        self.occupation = occupation
        self.emailAddress = emailAddress
    }
    
    static func ==(lhs: PresentableEmployeeSpy, rhs: PresentableEmployeeSpy) -> Bool {
        return lhs.name == rhs.name && lhs.occupation == rhs.occupation && lhs.emailAddress == rhs.emailAddress
    }
}
