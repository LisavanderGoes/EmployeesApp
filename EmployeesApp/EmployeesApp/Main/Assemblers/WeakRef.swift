//
//  Created by Peter Combee on 07/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class WeakRef<T: AnyObject> {
    
    private(set) weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
}
