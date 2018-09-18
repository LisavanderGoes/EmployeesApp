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

        func makeEmployeeListLayout(dataStore: DataStore<Employee>) -> EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee> {
            
            let employeeSelectionController = EmployeeSelectionController()
            
            let cellBuilder = EmployeeListLayout<ListLayoutOutputImpEmployee, ListDataSourceDataStoreAdapterEmployee>.CellBuilder()
            
            let dataSourceDataStoreAdapter = EmployeeListDataSourceDataStoreAdapter(dataStore: dataStore)
            
            let employeeListLayoutOutput = EmployeeListLayoutOutputImp(selectionController: employeeSelectionController, dataStore: dataStore)

            return EmployeeListLayout(employeeListDataSource: dataSourceDataStoreAdapter, cellBuilder: cellBuilder, output: employeeListLayoutOutput)
        }
    }
}
