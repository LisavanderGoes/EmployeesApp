//
//  Created by WebIQ Stagiaire on 17-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import UIKit

protocol DataStoreOutput {
    func didRemoveItem(at index: Int)
    func didAdd(item: Any)
}

class DataStore<T> {
    
    private var list: [T]!
    private let output: DataStoreOutput!
    
    init(list: [T], output: DataStoreOutput) {
        self.list = list
        self.output = output
    }
    
    func getItemAt(index: Int) -> T {
        return list[index]
    }
    
    func removeItemAt(index: Int) {
        list.remove(at: index)
        output.didRemoveItem(at: index)
    }
    
    func add(item: T) {
        list.append(item)
        output.didAdd(item: item)
    }
    
    func getListCount() -> Int {
        return list.count
    }
}
