
//  Created by WebIQ Stagiaire on 04-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBAction func loginButtonTapped() {
        let capturedUsername = usernameTextField.text ?? ""
        let capturedPassword = passwordTextField.text ?? ""
        loginClosure?(capturedUsername, capturedPassword)
    }
    
    override func viewDidLoad() {
        loadingIndicator.isHidden = true
    }
    
    var loginClosure: ((String, String) -> Void)?
    
    func show(message: String) {
        messageLabel.text = message
    }
    
    func showLoadingIndicator(){
        loadingIndicator.isHidden = false
    }
    
    func hideLoadingIndicator(){
        loadingIndicator.isHidden = true
    }
}
