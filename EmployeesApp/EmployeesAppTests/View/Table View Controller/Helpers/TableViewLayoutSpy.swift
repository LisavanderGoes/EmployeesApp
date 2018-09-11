//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit
@testable import EmployeesApp

class TableViewLayoutSpy: TableViewLayout{
    var configureIsCalled = false
    var capturedTableView: UITableView?
    
    func configure(_ tableView: UITableView) {
        configureIsCalled = true
        capturedTableView = tableView
    }
    
}
