//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit
@testable import EmployeesApp

class AddEmployeeViewControllerAssemblerDependencyFactorySpy: AddEmployeeViewControllerAssembler.DependencyFactory {
    
    var capturedAddEmployeeBarButton: BarButtonItem?
    
    override func makeAddEmployeeBarButtonItem() -> BarButtonItem {
        capturedAddEmployeeBarButton = super.makeAddEmployeeBarButtonItem()
        return capturedAddEmployeeBarButton!
    }
    
    var capturedViewController: CustomerInformationInputViewController?
    
    override func makeViewController(addEmployeeBarButtonItem: UIBarButtonItem) -> CustomerInformationInputViewController {
        capturedViewController = super.makeViewController(addEmployeeBarButtonItem: addEmployeeBarButtonItem)
        return capturedViewController!
    }
}
