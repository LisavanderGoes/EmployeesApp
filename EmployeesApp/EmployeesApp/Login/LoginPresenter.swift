
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class LoginPresenter : LoginUseCaseOutput {
    
    var checkHasSecceed : Bool!
    
    func checkHasSucceed(checkHasSucceed: Bool) {
        self.checkHasSecceed = checkHasSucceed
    }
    
}
