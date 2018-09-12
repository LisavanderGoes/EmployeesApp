//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeListLayout: NSObject, TableViewLayout, UITableViewDataSource, UITableViewDelegate {
    
    private var employeeList: [PresentableEmployee]!
    private var cellbuilder: CellBuilder!
    private var output: EmployeeListLayoutOutput!
    
    init(employeeList: [PresentableEmployee], cellBuilder: CellBuilder, output: EmployeeListLayoutOutput) {
        self.employeeList = employeeList
        self.cellbuilder = cellBuilder
        self.output = output
    }
    
    func configure(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EmployeeCell", bundle: Bundle.main), forCellReuseIdentifier: "EmployeeCell")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = employeeList[0]
        
        output.didSelectRow(employee: employee)
    }
}
