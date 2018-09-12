//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol EmployeeListLayoutOutput {
    func didSelectRow(employee: PresentableEmployee) -> Void
}
