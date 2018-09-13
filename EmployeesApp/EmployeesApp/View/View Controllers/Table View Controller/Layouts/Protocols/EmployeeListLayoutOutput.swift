//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol EmployeeListLayoutOutput {
    associatedtype EmployeeType: PresentableEmployee
    func didSelectRow(employee: EmployeeType) -> Void
    func didRemoveRow(atIndex: Int)
}
