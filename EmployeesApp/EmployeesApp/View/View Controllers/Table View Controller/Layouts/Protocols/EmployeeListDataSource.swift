//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol EmployeeListDataSource {
    associatedtype EmployeeType: PresentableEmployee
    func getEmployee(forRow row: Int) -> EmployeeType
    func getAmountOfEmployees() -> Int
    func removeEmployee(forRow row: Int)
}
