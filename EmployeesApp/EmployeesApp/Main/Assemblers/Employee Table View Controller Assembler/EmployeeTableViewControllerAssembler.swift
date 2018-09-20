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
    
    func assembleEmployeeTableViewController(didAddItemClosure: @escaping () -> Void) -> UIViewController {
        
        let dataSource = dependencyFactory.makeDataSourceAdapter(dataStore: dataStore)
        
        let sellectionController = dependencyFactory.makeSelectionController()
        
        let output = dependencyFactory.makeListLayoutOutput(sellectionController: sellectionController, dataStore: dataStore)
        
        let employeeListLayout = dependencyFactory.makeListLayout(dataSource: dataSource, output: output)
        
        _ = DataStoreNavigationUpdaterAdapter(didAddItemClosure: didAddItemClosure)
        
        let viewController = dependencyFactory.makeViewController(layout: employeeListLayout)
        
        dataStore.output = viewController.tableView
        return viewController
    }
}
