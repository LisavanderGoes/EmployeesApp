//
//  Created by WebIQ Stagiaire on 17-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class EmployeeListDataSourceDataStoreAdapter<EmployeeType: PresentableEmployee>: EmployeeListDataSource {
    
    private var dataStore: DataStore<EmployeeType>!
    
    init(dataStore: DataStore<EmployeeType>) {
        self.dataStore = dataStore
    }
    
    func getEmployee(forRow at: Int) -> EmployeeType {
        return dataStore.getItemAt(index: at)
    }
    
    func getEmployeeCount() -> Int {
        return dataStore.getListCount()
    }
}
