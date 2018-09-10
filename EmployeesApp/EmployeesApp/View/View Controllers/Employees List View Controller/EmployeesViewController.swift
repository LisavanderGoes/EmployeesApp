//
//  Created by WebIQ Stagiaire on 10-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UITableViewCell!
}

class EmployeesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var employeesList = [String]()
    
    convenience init(employeesList: [String]) {
        self.init()
        self.employeesList = employeesList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return EmployeeTableViewCell()
    }
}
