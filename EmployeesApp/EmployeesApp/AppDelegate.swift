//
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        let employees = [Employee(name: "name1", occupationCase: Occupation.Backend_Developer, emailAddress: "email")]
//
//        let dependencyFactory = EmployeeTableViewControllerAssembler.DependencyFactory()
//
//        let dataStore = DataStore<Employee>()
//
//        let employeeViewControllerAssembler =
//            EmployeeTableViewControllerAssembler(
//                dependencyFactory: dependencyFactory,
//                dataStore: dataStore
//        )
//
//        employees.forEach { employee in
//            dataStore.add(item: employee)
//        }
//
//        let viewController = employeeViewControllerAssembler.assembleEmployeeTableViewController()
        
        let dataStore = DataStore<Employee>()
        
        let dependencyFactory = AddEmployeeViewControllerAssembler.DependencyFactory(dataStore: dataStore)
        
        let assembler = AddEmployeeViewControllerAssembler(dependencyFactory: dependencyFactory)
        
        let viewController = assembler.assembleAddEmployeeViewController()
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
