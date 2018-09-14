//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

extension UITableView: DataStoreDelegate {
    func didAddItem(atIndex index: Int) {
        insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
}
