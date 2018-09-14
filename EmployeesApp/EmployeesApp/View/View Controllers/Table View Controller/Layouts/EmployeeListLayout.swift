//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeListLayout<OutputType: EmployeeListLayoutOutput, DataSourceType: EmployeeListDataSource>: NSObject, TableViewLayout, UITableViewDataSource, UITableViewDelegate where OutputType.EmployeeType == DataSourceType.EmployeeType {
    
    typealias EmployeeType = OutputType.EmployeeType
    
    private let dataSource: DataSourceType
    private let cellbuilder: CellBuilder!
    private let output: OutputType!
    
    init(dataSource: DataSourceType, cellBuilder: CellBuilder, output: OutputType) {
        self.dataSource = dataSource
        self.cellbuilder = cellBuilder
        self.output = output
    }
    
    func configure(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EmployeeCell", bundle: Bundle.main), forCellReuseIdentifier: "EmployeeCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.getAmountOfEmployees()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellbuilder.makeCell(
            for: dataSource.getEmployee(forRow: indexPath.row),
            for: tableView
        )
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        dataSource.removeEmployee(forRow: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectRow(employee: dataSource.getEmployee(forRow: indexPath.row))
    }
}
