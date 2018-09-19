//
//  Created by WebIQ Stagiaire on 19-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
import UIKit
@testable import EmployeesApp

class CustomerInformationInputViewControllerTest: XCTestCase {
    
    var sut: CustomerInformationInputViewController!
    var formInputCollectorSpy: CustomerInformationFormInputCollectorSpy!
    var pickerView: UIPickerView!
    
    override func setUp() {
        formInputCollectorSpy = CustomerInformationFormInputCollectorSpy()
        sut = CustomerInformationInputViewController(formInputCollector: formInputCollectorSpy)
        _ = sut.view
        pickerView = UIPickerView()
        sut.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
    }
    
    func test_viewDidLoad_nameTextFieldIsConnected() {
        XCTAssertNotNil(sut.nameTextField)
    }
    
    func test_viewDidLoad_emailTextFieldIsConnected() {
        XCTAssertNotNil(sut.emailAddressTextField)
    }
    
    func test_viewDidLoad_occupationPickerViewIsConnected() {
        XCTAssertNotNil(sut.occupationPickerView)
    }
    
    func test_viewDidLoad_submitButtonIsConnected() {
        XCTAssertNotNil(sut.submitButton)
    }
    
    func test_viewDidLoad_collectFormInputIsCalled() {
        sut.submitButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(formInputCollectorSpy.collectFormInputIsCalled)
    }
    
    func test_viewDidLoad_occupationPickerViewDataSourceToSelf() {
        XCTAssertTrue(sut.occupationPickerView.dataSource === sut)
    }
    
    func test_viewDidLoad_occupationPickerViewDelegateToSelf() {
        XCTAssertTrue(sut.occupationPickerView.delegate === sut)
    }
    
    //MARK: PickerView
    func test_pickerView_numberOfRowsInComponent() {
        XCTAssertEqual(sut.occupationPickerView.numberOfRows(inComponent: 0), Occupation.count())
    }
    
    func test_pickerView_titleForRow() {
        let occupationTitle = sut.pickerView(pickerView, titleForRow: 0, forComponent: 0)
        XCTAssertEqual(occupationTitle, Occupation.allCases()[0].rawValue)
    }
    
    func test_pickerView_titleForRowTwo() {
        let occupationTitle = sut.pickerView(pickerView, titleForRow: 1, forComponent: 0)
        XCTAssertEqual(occupationTitle, Occupation.allCases()[1].rawValue)
    }
    
    //MARK: CollectFromInput
    func test_collectFromInput_submitButtonTapped_nameIsCapturedName() {
        let name = "name"
        sut.nameTextField.text = name
        sut.submitButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(formInputCollectorSpy.capturedName, name)
    }
    
    func test_collectFromInput_submitButtonTapped_emailAddressIsCapturedEmailAddress() {
        let emailAddress = "email"
        sut.emailAddressTextField.text = emailAddress
        sut.submitButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(formInputCollectorSpy.capturedEmailAddress, emailAddress)
    }
    
    func test_collectFromInput_submitButtonTapped_occupationIsCapturedOccupaion() {
        let occupation = Occupation.allCases()[0]
        sut.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
        sut.submitButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(formInputCollectorSpy.capturedOccuption, occupation)
    }
}

class CustomerInformationFormInputCollectorSpy: CustomerInformationFormInputCollector {
    
    var collectFormInputIsCalled = false
    var capturedName: String?
    var capturedEmailAddress: String?
    var capturedOccuption: Occupation?
    
    override func collectFormInput(name: String, emailAddress: String, occupation: Occupation) {
        collectFormInputIsCalled = true
        self.capturedName = name
        self.capturedEmailAddress = emailAddress
        self.capturedOccuption = occupation
    }
}
