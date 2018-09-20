//
//  Created by WebIQ Stagiaire on 20-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class DataStoreNavigationUpdaterAdapter: DataStoreOutput {
    
    var didAddItemClosure: () -> Void
    
    init(didAddItemClosure: @escaping () -> Void) {
        self.didAddItemClosure = didAddItemClosure
    }
    
    func didRemoveItem(at index: Int) {}
    
    func didAdd(at index: Int) {
        didAddItemClosure()
    }
    
}
