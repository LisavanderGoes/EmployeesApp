//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

extension EmployeeListViewControllerAssembler {
    
    class DependencyFactory {
        
        typealias EmployeeListLayoutType = EmployeeListLayout<EmployeeSelectionController, EmployeeListDataSourceDataStoreAdapter>
        
        func makeViewController(layout: EmployeeListLayoutType) -> TableViewController {
            return TableViewController(layout: layout)
        }
        
        func makeSelectionController(didSelectEmployee: @escaping (Employee) -> Void) -> EmployeeSelectionController {
            return EmployeeSelectionController(closure: didSelectEmployee)
        }
        
        func makeListDataSourceAdapter(dataStore: DataStore<Employee>) -> EmployeeListDataSourceDataStoreAdapter {
            return EmployeeListDataSourceDataStoreAdapter(dataStore: dataStore)
        }
        
        func makeCellBuilder() -> EmployeeListLayoutType.CellBuilder {
            return EmployeeListLayoutType.CellBuilder()
        }
        
        func makeEmployeeListLayout(
            dataSource: EmployeeListDataSourceDataStoreAdapter,
            cellBuilder: EmployeeListLayoutType.CellBuilder,
            selectionController: EmployeeSelectionController
        ) -> EmployeeListLayoutType {
            return EmployeeListLayout(
                dataSource: dataSource,
                cellBuilder: cellBuilder,
                output: selectionController
            )
        }
    }
}
