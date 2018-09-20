//
//  Created by WebIQ Stagiaire on 18-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

extension UITableView: DataStoreOutput {
    func didRemoveItem(at index: Int) {
        deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func didAdd(at index: Int) {
        insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
}
