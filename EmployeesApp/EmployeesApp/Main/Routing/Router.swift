//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class Router {
    
    private let navigationController: UINavigationController
    private let viewControllerFactory: ViewControllerFactory
    
    init(
        navigationController: UINavigationController,
        viewControllerFactory: ViewControllerFactory
    ) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func routeToAuthenticationController(authenticationDidSucceed: @escaping () -> Void) {
        let viewController = viewControllerFactory.makeAuthenticationViewController(
            authenticationDidSucceed: authenticationDidSucceed
        )
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.viewControllers = [viewController]
    }
    
    private weak var presentedEmployeeListController: UIViewController?
    
    func routeToEmployeeListController(
        didSelectAddEmployee: @escaping () -> Void,
        didSelectEmployee: @escaping (Employee) -> Void
    ) {
        let viewController = viewControllerFactory.makeEmployeeListViewController(
            didSelectEmployee: didSelectEmployee
        )
        let addEmployeeBarButton = BarButtonItem()
        addEmployeeBarButton.title = "oprotte"
        addEmployeeBarButton.tapAction = didSelectAddEmployee
        viewController.navigationItem.setRightBarButton(addEmployeeBarButton, animated: false)
        viewController.navigationItem.hidesBackButton = true
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(viewController, animated: true)
        presentedEmployeeListController = viewController
    }
    
    func routeToAddEployeeController() {
        let viewController = viewControllerFactory.makeAddEmployeeViewController(
            didAddEmployee: { [weak self] in
                guard let presentedEmployeeListController = self?.presentedEmployeeListController else { return }
                self?.navigationController.popToViewController(presentedEmployeeListController, animated: true)
            }
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToEmployeeDetailsController(forEmployee employee: Employee) {
        let viewController = UIViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
