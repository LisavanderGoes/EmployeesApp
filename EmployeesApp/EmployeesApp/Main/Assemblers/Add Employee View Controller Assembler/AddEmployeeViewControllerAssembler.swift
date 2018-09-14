//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class AddEmployeeViewControllerAssembler {
    
    private let dataStore: DataStore<Employee>
    private let dependencyFactory: DependencyFactory
    
    init(
        dataStore: DataStore<Employee>,
        dependencyFactory: DependencyFactory
    ) {
        self.dataStore = dataStore
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleAddEmployeeViewController(didAddEmployee: @escaping () -> Void) -> UIViewController {
        let employeeInformationInputCollector = dependencyFactory.makeInputInformationCollector()
        let employeeInformationConverter = dependencyFactory.makeEmployeeInformationConverter()
        let employeePersister = dependencyFactory.makeEmployeePersister(
            inputCollector: employeeInformationInputCollector,
            converter: employeeInformationConverter,
            dataStore: dataStore
        )
        let addEmployeeButton = dependencyFactory.makeAddEmployeebarButtonItem(
            employeePersister: employeePersister
        )
        let viewController = dependencyFactory.makeEmployeeInformationInputViewController(
            addEmployeeBarButtonItem: addEmployeeButton,
            inputCollector: employeeInformationInputCollector
        )
        return viewController
    }
}
