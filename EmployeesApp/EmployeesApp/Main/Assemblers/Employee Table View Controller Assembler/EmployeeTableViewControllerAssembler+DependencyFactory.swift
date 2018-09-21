//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

extension EmployeeTableViewControllerAssembler {

    class DependencyFactory {

        typealias ListLayoutOutputImpEmployee = EmployeeListLayoutOutputImp<Employee>
        
        typealias ListDataSourceDataStoreAdapterEmployee = EmployeeListDataSourceDataStoreAdapter<Employee>
        
        
        let dataStore: DataStore<Employee>
        
        init(dataStore: DataStore<Employee>) {
            self.dataStore = dataStore
        }
        
        func makeViewController(layout: EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee>) -> TableViewController {
            let viewController = TableViewController(layout: layout)
            dataStore.output = viewController.tableView
            return viewController
        }
        
        func makeSelectionController() -> EmployeeSelectionController {
            return EmployeeSelectionController()
        }
        
        func makeDataSourceAdapter() -> EmployeeListDataSourceDataStoreAdapter<Employee> {
            return EmployeeListDataSourceDataStoreAdapter(dataStore: dataStore)
        }
        
        func makeListLayoutOutput(sellectionController: EmployeeSelectionController) -> EmployeeListLayoutOutputImp<Employee> {
            return EmployeeListLayoutOutputImp(selectionController: sellectionController, dataStore: dataStore)
        }

        func makeListLayout(dataSource: EmployeeListDataSourceDataStoreAdapter<Employee>,
                                    output: EmployeeListLayoutOutputImp<Employee>) -> EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee> {
            
            let cellBuilder = EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee>.CellBuilder()
            
            return EmployeeListLayout(employeeListDataSource: dataSource, cellBuilder: cellBuilder, output: output)
        }
    }
}
