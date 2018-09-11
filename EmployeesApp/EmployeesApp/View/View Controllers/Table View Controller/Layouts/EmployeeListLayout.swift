//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeListLayout: NSObject, TableViewLayout, UITableViewDataSource {
    
    private var employeeList: [PresentableEmployee]!
    private var cellbuilder: CellBuilder!
    
    init(employeeList: [PresentableEmployee], cellBuilder: CellBuilder) {
        self.employeeList = employeeList
        self.cellbuilder = cellBuilder
    }
    
    func configure(_ tableView: UITableView) {
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellbuilder.makeCell(
            for: employeeList[indexPath.row],
            for: tableView
        )
    }
}
