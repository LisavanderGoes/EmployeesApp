//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

extension AddEmployeeViewControllerAssembler {
    
    class DependencyFactory {
        
        func makeAddEmployeebarButtonItem(
            employeePersister: EmployeePersister
        ) -> BarButtonItem {
            let barButtonItem = BarButtonItem()
            barButtonItem.tapAction = {
                employeePersister.persist()
            }
            return barButtonItem
        }
        
        func makeEmployeePersister(
            inputCollector: EmployeeInformationInputCollector,
            converter: EmployeeInformationConverter,
            dataStore: DataStore<Employee>
        ) -> EmployeePersister {
            return EmployeePersister(
                inputCollector: inputCollector,
                converter: converter,
                dataStore: dataStore
            )
        }
        
        func makeEmployeeInformationConverter() -> EmployeeInformationConverter {
            return EmployeeInformationConverter()
        }
        
        func makeEmployeeInformationInputViewController(
            addEmployeeBarButtonItem: BarButtonItem,
            inputCollector: EmployeeInformationInputCollector
        ) -> EmployeeInformationInputViewController {
            let viewController = EmployeeInformationInputViewController()
            viewController.navigationItem.setRightBarButton(addEmployeeBarButtonItem, animated: false)
            viewController.customerInformationInputValuesDidChange = inputCollector.collect
            return viewController
        }
        
        func makeInputInformationCollector() -> EmployeeInformationInputCollector {
            return EmployeeInformationInputCollector()
        }
    }
}
