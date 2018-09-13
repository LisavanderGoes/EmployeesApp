//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeTableViewControllerAssembler {
    
    private let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleEmployeeTableViewController() -> UIViewController {
        
        let employeeListLayout = dependencyFactory.makeEmployeeListLayout()
        
        let viewController = dependencyFactory.makeViewController(layout: employeeListLayout)
        
        return viewController
    }
}
