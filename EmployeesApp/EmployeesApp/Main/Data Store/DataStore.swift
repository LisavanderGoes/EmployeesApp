//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

class DataStore<ItemType> {
    
    private var storedItems: [ItemType] = []
    
    weak var delegate: DataStoreDelegate?
    
    func getItem(atIndex index: Int) -> ItemType {
        return storedItems[index]
    }
    
    func getAmountOfItems() -> Int {
        return storedItems.count
    }
    
    func add(item: ItemType, atIndex index: Int) {
        storedItems.insert(item, at: index)
        delegate?.didAddItem(atIndex: index)
    }

    func removeItem(atIndex index: Int) {
        storedItems.remove(at: index)
    }
}
