//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var layout: TableViewLayout?
    
    convenience init(layout: TableViewLayout) {
        self.init()
        self.layout = layout
    }
    
    override func viewDidLoad() {
        layout?.configure(tableView)
    }
}
