//
//  Created by WebIQ Stagiaire on 21-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class AddEmployeeViewControllerAssembler {
    
    private let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleAddEmployeeViewController() -> UIViewController {
        
        let addEmployeeBarButtonItem = dependencyFactory.makeAddEmployeeBarButtonItem()
        
        let collector = dependencyFactory.makeCollector()
        
        let converter = dependencyFactory.makeConverter()
        
        let employeePersister = dependencyFactory.makeEmployeePersister(converter: converter)
        
        let viewController = dependencyFactory.makeViewController(addEmployeeBarButtonItem: addEmployeeBarButtonItem)
        
        addEmployeeBarButtonItem.tabActionClosure = {
            
            collector.collectFormInput(name: viewController.getName(),
                                       emailAddress: viewController.getEmailAddress(),
                                       occupation: viewController.getOccupation()
            )
            
            employeePersister.persist(formInputCollector: collector)
        }
        return viewController
    }
}

extension AddEmployeeViewControllerAssembler {
    
    class DependencyFactory {
        
        private let dataStore: DataStore<Employee>
        
        init(dataStore: DataStore<Employee>) {
            self.dataStore = dataStore
        }
        
        func makeAddEmployeeBarButtonItem() -> BarButtonItem {
            return BarButtonItem()
        }
        
        func makeCollector() -> CustomerInformationFormInputCollector {
            return CustomerInformationFormInputCollector()
        }
        
        func makeConverter() -> EmployeeInformationConverter {
            return EmployeeInformationConverter()
        }
        
        func makeEmployeePersister(converter: EmployeeInformationConverter) -> EmployeePersister {
            return EmployeePersister(converter: converter, dataStore: dataStore)
        }
        
        func makeViewController(addEmployeeBarButtonItem: UIBarButtonItem) -> CustomerInformationInputViewController {
            let viewController = CustomerInformationInputViewController()
            viewController.navigationItem.setRightBarButton(addEmployeeBarButtonItem, animated: false)
            return viewController
        }
    }
}
