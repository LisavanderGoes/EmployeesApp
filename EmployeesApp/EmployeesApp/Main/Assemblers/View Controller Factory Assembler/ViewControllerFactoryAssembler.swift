//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class ViewControllerFactoryAssembler {
    
    private let dependencyFactory: DependencyFactory
    
    init(dependencyFactory: DependencyFactory) {
        self.dependencyFactory = dependencyFactory
    }
    
    func assembleViewControllerFactory() -> ViewControllerFactory {
        return ViewControllerFactory(
            authenticationViewControllerAssembler: makeUserAuthenticationViewControllerAssembler(),
            addEmployeeViewControllerAssembler: makeAddEmployeeViewControllerAssembler(),
            employeeListViewControllerAssembler: makeEmployeeListViewControllerAssembler()
        )
    }
    
    private func makeUserAuthenticationViewControllerAssembler() -> UserAuthenticationViewControllerAssembler {
        let dependencyFactory = self.dependencyFactory.makeAuthenticationViewControllerAssemblerDependencyFactory()
        let assembler = self.dependencyFactory.makeAuthenticationViewControllerAssembler(
            dependencyFactory: dependencyFactory
        )
        return assembler
    }

    private func makeAddEmployeeViewControllerAssembler() -> AddEmployeeViewControllerAssembler {
        let dependencyFactory = self.dependencyFactory.makeAddEmployeeViewControllerAssemblerDependencyFactory()
        let assembler = self.dependencyFactory.makeAddEmployeeViewControllerAssembler(
            dependencyFactory: dependencyFactory
        )
        return assembler
    }
    
    private func makeEmployeeListViewControllerAssembler() -> EmployeeListViewControllerAssembler {
        let dependencyFactory = self.dependencyFactory.makeEmployeeListViewControllerAssemblerDependencyFactory()
        let assembler = self.dependencyFactory.makeEmployeeListViewControllerAssembler(
            dependencyFactory: dependencyFactory
        )
        return assembler
    }
}
