//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol LoginUseCaseOutput {
    func checkHasSucceed()
    func checkHasFailed(reason: String)
}
