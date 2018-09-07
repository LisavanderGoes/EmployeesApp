//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class UserAuthenticationViewControllerAssembler {
    
    private let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleUserAuthenticationViewController() -> UIViewController {
        return dependencyFactory.makeViewController()
    }
}

extension UserAuthenticationViewControllerAssembler {
    
    class DependencyFactory {
        
        func makeViewController() -> LoginViewController {
            return LoginViewController()
        }
    }
}
