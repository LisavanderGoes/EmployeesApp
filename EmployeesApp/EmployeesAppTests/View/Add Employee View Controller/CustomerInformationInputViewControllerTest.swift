//
//  Created by WebIQ Stagiaire on 19-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
import UIKit
@testable import EmployeesApp

class CustomerInformationInputViewControllerTest: XCTestCase {
    
    var sut: CustomerInformationInputViewController!
    var pickerView: UIPickerView!
    
    override func setUp() {
        sut = CustomerInformationInputViewController()
        _ = sut.view
        pickerView = UIPickerView()
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
    
    func test_viewDidLoad_occupationPickerViewDataSourceToSelf() {
        XCTAssertTrue(sut.occupationPickerView.dataSource === sut)
    }
    
    func test_viewDidLoad_occupationPickerViewDelegateToSelf() {
        XCTAssertTrue(sut.occupationPickerView.delegate === sut)
    }
    
    //MARK: PickerView
    func test_pickerView_numberOfRowsInComponent() {
        XCTAssertEqual(sut.occupationPickerView.numberOfRows(inComponent: 0), Occupation.allCases().count)
    }
    
    func test_pickerView_titleForRow() {
        let occupationTitle = sut.pickerView(pickerView, titleForRow: 0, forComponent: 0)
        XCTAssertEqual(occupationTitle, Occupation.allCases()[0].rawValue)
    }
    
    func test_pickerView_titleForRowTwo() {
        let occupationTitle = sut.pickerView(pickerView, titleForRow: 1, forComponent: 0)
        XCTAssertEqual(occupationTitle, Occupation.allCases()[1].rawValue)
    }
    
    func test_getName_returnName() {
        let name = "name"
        sut.nameTextField.text = name
        XCTAssertEqual(sut.getName(), name)
    }

    func test_getEmailAddress_returnEmailAddress() {
        let emailAddress = "email"
        sut.emailAddressTextField.text = emailAddress
        XCTAssertEqual(sut.getEmailAddress(), emailAddress)
    }

    func test_getOccupation_returnOccuption() {
        let occupation = Occupation.allCases()[1]
        sut.pickerView(pickerView, didSelectRow: 1, inComponent: 0)
        XCTAssertEqual(sut.getOccupation(), occupation)
    }
}
