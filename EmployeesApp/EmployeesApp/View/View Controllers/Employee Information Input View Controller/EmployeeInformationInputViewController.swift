//
//  Created by Peter Combee on 14/09/2018.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

struct EmployeeInformation {
    let name: String?
    let emailAddress: String?
    let ocupation: String?
}

class EmployeeInformationInputViewController: UIViewController, UITextFieldDelegate {
 
    @IBOutlet private(set) var nameField: UITextField?
    @IBOutlet private(set) var emailField: UITextField?
    
    var customerInformationInputValuesDidChange: ((EmployeeInformation) -> Void)?
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        customerInformationInputValuesDidChange?(EmployeeInformation(
            name: nameField?.text,
            emailAddress: emailField?.text,
            ocupation: nil
        ))
        return true
    }
}
