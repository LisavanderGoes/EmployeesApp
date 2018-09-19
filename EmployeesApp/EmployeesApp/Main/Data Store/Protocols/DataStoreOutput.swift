//
//  Created by WebIQ Stagiaire on 18-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol DataStoreOutput: class {
    func didRemoveItem(at index: Int)
    func didAdd(at index: Int)
}
