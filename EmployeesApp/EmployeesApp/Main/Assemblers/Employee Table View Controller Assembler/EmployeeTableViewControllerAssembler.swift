//
//  Created by WebIQ Stagiaire on 12-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeTableViewControllerAssembler {
    
    private let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleEmployeeTableViewController(didAddItemClosure: @escaping () -> Void) -> UIViewController {
        
        let dataSource = dependencyFactory.makeDataSourceAdapter()
        
        let sellectionController = dependencyFactory.makeSelectionController()
        
        let output = dependencyFactory.makeListLayoutOutput(sellectionController: sellectionController)
        
        let employeeListLayout = dependencyFactory.makeListLayout(dataSource: dataSource, output: output)
        
        _ = DataStoreNavigationUpdaterAdapter(didAddItemClosure: didAddItemClosure)
        
        let viewController = dependencyFactory.makeViewController(layout: employeeListLayout)
        
        return viewController
    }
}
