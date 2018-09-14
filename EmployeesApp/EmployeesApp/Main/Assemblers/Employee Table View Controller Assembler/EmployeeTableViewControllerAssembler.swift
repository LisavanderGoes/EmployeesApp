//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeListViewControllerAssembler {
    
    private let dataStore: DataStore<Employee>
    private let dependencyFactory: DependencyFactory
    
    init(
        dataStore: DataStore<Employee>,
        dependencyFactory: DependencyFactory
    ) {
        self.dataStore = dataStore
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleEmployeeTableViewController(
        didSelectEmployee: @escaping (Employee) -> Void
    ) -> UIViewController {
        let cellBuilder = dependencyFactory.makeCellBuilder()
        let dataSource = dependencyFactory.makeListDataSourceAdapter(dataStore: dataStore)
        let selectionController = dependencyFactory.makeSelectionController(didSelectEmployee: didSelectEmployee)
        let employeeListLayout = dependencyFactory.makeEmployeeListLayout(
            dataSource: dataSource,
            cellBuilder: cellBuilder,
            selectionController: selectionController
        )
        let viewController = dependencyFactory.makeViewController(layout: employeeListLayout)
        dataStore.delegate = viewController.tableView
        return viewController
    }
}
