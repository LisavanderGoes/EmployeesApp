//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

extension EmployeeTableViewControllerAssembler {

    class DependencyFactory {

        typealias ListLayoutOutputImpEmployee = EmployeeListLayoutOutputImp<Employee>
        
        typealias ListDataSourceDataStoreAdapterEmployee = EmployeeListDataSourceDataStoreAdapter<Employee>
        
        
        func makeViewController(layout: EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee>) -> TableViewController {
            return TableViewController(layout: layout)
        }
        
        func makeSelectionController() -> EmployeeSelectionController {
            return EmployeeSelectionController()
        }
        
        func makeDataSourceAdapter(dataStore: DataStore<Employee>) -> EmployeeListDataSourceDataStoreAdapter<Employee> {
            return EmployeeListDataSourceDataStoreAdapter(dataStore: dataStore)
        }
        
        func makeListLayoutOutput(sellectionController: EmployeeSelectionController,
                                  dataStore: DataStore<Employee>) -> EmployeeListLayoutOutputImp<Employee> {
            return EmployeeListLayoutOutputImp(selectionController: sellectionController, dataStore: dataStore)
        }

        func makeListLayout(dataSource: EmployeeListDataSourceDataStoreAdapter<Employee>,
                                    output: EmployeeListLayoutOutputImp<Employee>) -> EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee> {
            
            let cellBuilder = EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee>.CellBuilder()
            
            return EmployeeListLayout(employeeListDataSource: dataSource, cellBuilder: cellBuilder, output: output)
        }
    }
}
