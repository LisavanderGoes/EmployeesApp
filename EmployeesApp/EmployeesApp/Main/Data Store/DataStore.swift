//
//  Created by WebIQ Stagiaire on 17-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import UIKit

class DataStore<T> {
    
    private var list: [T] = []
    var output: DataStoreOutput?
    
    func getItemAt(index: Int) -> T {
        return list[index]
    }
    
    func removeItemAt(index: Int) {
        list.remove(at: index)
        output?.didRemoveItem(at: index)
    }
    
    func add(item: T) {
        let index = list.count
        list.append(item)
        output?.didAdd(at: index)
    }
    
    func getListCount() -> Int {
        return list.count
    }
}
