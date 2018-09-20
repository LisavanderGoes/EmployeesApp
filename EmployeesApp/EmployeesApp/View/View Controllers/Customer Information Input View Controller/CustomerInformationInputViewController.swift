//
//  Created by WebIQ Stagiaire on 19-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import UIKit

class CustomerInformationInputViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var occupationPickerView: UIPickerView!
    @IBOutlet weak var submitButton: UIButton!
    
    private var formInputCollector: CustomerInformationFormInputCollector!
    private var occupation: Occupation?
    private var occupationList: [Occupation]!
    
    convenience init(formInputCollector: CustomerInformationFormInputCollector) {
        self.init()
        self.formInputCollector = formInputCollector
    }
    
    @IBAction func submitButtonTapped() {
        let name = nameTextField.text ?? ""
        let emailAddress = emailAddressTextField.text ?? ""
        let occupation = self.occupation ?? occupationList[0]
        
        formInputCollector.collectFormInput(name: name, emailAddress: emailAddress, occupation: occupation)
    }
    
    override func viewDidLoad() {
        occupationPickerView.dataSource = self
        occupationPickerView.delegate = self
        occupationList = Occupation.allCases()
        if occupationList.isEmpty {
            occupationPickerView.isUserInteractionEnabled = false
            submitButton.isEnabled = false
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return occupationList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return occupationList[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        self.occupation = occupationList[row]
    }
}

