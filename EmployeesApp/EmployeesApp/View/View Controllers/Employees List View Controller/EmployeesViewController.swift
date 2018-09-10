//
//  Created by WebIQ Stagiaire on 10-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import UIKit

class EmployeesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var employeesTableView: UITableView!
    var employeesList: [String]?
    private var tableViewCell: UITableViewCell!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if employeesList != nil {
            return employeesList!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewCell
    }
}
