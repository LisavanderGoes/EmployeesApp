//
//  Created by WebIQ Stagiaire on 17-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol EmployeeListDataSource {
    associatedtype EmployeeType: PresentableEmployee
    func getEmployee(forRow at: Int) -> EmployeeType
    func getEmployeeCount() -> Int
}

