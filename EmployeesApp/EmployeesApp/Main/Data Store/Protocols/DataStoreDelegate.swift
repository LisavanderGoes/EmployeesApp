//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol DataStoreDelegate: class {
    func didAddItem(atIndex index: Int)
}
