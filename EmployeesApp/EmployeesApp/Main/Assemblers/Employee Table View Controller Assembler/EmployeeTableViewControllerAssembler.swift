//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeTableViewControllerAssembler {
    
    private let dependencyFactory: DependencyFactory
    let dataStore: DataStore<Employee>
    
    init(dependencyFactory: DependencyFactory, dataStore: DataStore<Employee>) {
        self.dependencyFactory = dependencyFactory
        self.dataStore = dataStore
    }
    
    func assembleEmployeeTableViewController() -> UIViewController {
        
        let employeeListLayout = dependencyFactory.makeEmployeeListLayout(dataStore: dataStore)
        
        let viewController = dependencyFactory.makeViewController(layout: employeeListLayout)
        
        dataStore.output = viewController.tableView
        return viewController
    }
}
