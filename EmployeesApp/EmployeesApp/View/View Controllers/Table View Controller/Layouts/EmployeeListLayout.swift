//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeListLayout<OutputType: EmployeeListLayoutOutput, DataSourceType: EmployeeListDataSource>: NSObject, TableViewLayout, UITableViewDataSource, UITableViewDelegate {
    
    typealias EmployeeType = DataSourceType.EmployeeType
    
    private var dataSource: DataSourceType!
    private var cellbuilder: CellBuilder!
    private var output: OutputType!
    
    init(employeeListDataSource: DataSourceType, cellBuilder: CellBuilder, output: OutputType) {
        self.dataSource = employeeListDataSource
        self.cellbuilder = cellBuilder
        self.output = output
    }
    
    func configure(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EmployeeCell", bundle: Bundle.main), forCellReuseIdentifier: "EmployeeCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.getEmployeeCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellbuilder.makeCell(
            for: dataSource.getEmployee(forRow: indexPath.row),
            for: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = dataSource.getEmployee(forRow: indexPath.row) as! OutputType.EmployeeType
        output.didSelectRow(employee: employee)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            output.removeItem(at: indexPath.row)
        }
    }
    
}
