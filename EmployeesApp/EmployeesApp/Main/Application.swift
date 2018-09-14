//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class Application {
    
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        router.routeToAuthenticationController(authenticationDidSucceed: { [weak self] in
            self?.routeToEmployeeListController()
        })
    }
    
    private func routeToEmployeeListController() {
        router.routeToEmployeeListController(
            didSelectAddEmployee: { [weak self] in
                self?.router.routeToAddEployeeController()
            },
            didSelectEmployee: { [weak self] selectedEmployee in
                self?.router.routeToEmployeeDetailsController(forEmployee: selectedEmployee)
            }
        )
    }
}
