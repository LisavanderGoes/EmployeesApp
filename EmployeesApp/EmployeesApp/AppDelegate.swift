//
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var applicationFlow: Application!
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        
        let applicationAssembler = ApplicationAssembler(
            dependencyFactory: ApplicationAssembler.DependencyFactory()
        )
    
        applicationFlow = applicationAssembler.assembleApplication(
            navigationController: navigationController
        )

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        applicationFlow.start()
    }
}
