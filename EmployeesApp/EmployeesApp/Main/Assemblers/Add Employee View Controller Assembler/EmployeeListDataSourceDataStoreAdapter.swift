//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeListDataSourceDataStoreAdapter: EmployeeListDataSource {

    private let dataStore: DataStore<Employee>
    
    init(dataStore: DataStore<Employee>) {
        self.dataStore = dataStore
    }
    
    func getEmployee(forRow row: Int) -> Employee {
        return dataStore.getItem(atIndex: row)
    }
    
    func getAmountOfEmployees() -> Int {
        return dataStore.getAmountOfItems()
    }
    
    func removeEmployee(forRow row: Int) {
        dataStore.removeItem(atIndex: row)
    }
}
