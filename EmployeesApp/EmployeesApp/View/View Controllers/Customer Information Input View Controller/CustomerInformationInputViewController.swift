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
    
    convenience init(formInputCollector: CustomerInformationFormInputCollector) {
        self.init()
        self.formInputCollector = formInputCollector
    }
    
    @IBAction func sumbitButtonTapped() {
        let name = nameTextField.text ?? ""
        let emailAddress = emailAddressTextField.text ?? ""
        let occupation = self.occupation!
        
        formInputCollector.collectFormInput(name: name, emailAddress: emailAddress, occupation: occupation)
    }
    
    override func viewDidLoad() {
        occupationPickerView.dataSource = self
        occupationPickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Occupation.count()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Occupation.allCases()[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        self.occupation = Occupation.allCases()[row]
        //enable button
    }
}

