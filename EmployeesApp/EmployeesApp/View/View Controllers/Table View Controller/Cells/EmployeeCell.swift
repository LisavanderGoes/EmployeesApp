//
//  Created by Peter Combee on 11/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    func set(name: String) {
        self.nameLabel.text = name
    }
    
    func set(occupation: String) {
        self.occupationLabel.text = occupation
    }
    
    func set(emailAddress: String) {
        self.emailAddressLabel.text = emailAddress
    }
}
