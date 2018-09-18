//
//  Created by WebIQ Stagiaire on 17-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import XCTest
@testable import EmployeesApp

class DataStoreTest: XCTestCase {
    
    var output: DataStoreOutputSpy!
    
    override func setUp() {
        output = DataStoreOutputSpy()
    }
    
    func test_getItemAtIndex() {
        let list = ["string1"]
        XCTAssertEqual(makeSUT(list: list).getItemAt(index: 0), list[0])
    }
    
    func test_getItemAtIndex_withRightIndex() {
        let list = ["string1", "string2"]
        XCTAssertEqual(makeSUT(list: list).getItemAt(index: 1), list[1])
    }
    
    //MARK: RemoveItemAtIndex
    func test_removeItemAtIndex() {
        let list = ["string1", "string2"]
        makeSUT(list: list).removeItemAt(index: 0)
        XCTAssertTrue(output.didRemoveItem)
    }
    
    func test_removeItemAtIndex_withRightIndex() {
        let list = ["string1", "string2"]
        makeSUT(list: list).removeItemAt(index: 1)
        XCTAssertEqual(output.capturedIndex, 1)
    }
    
    //MARK: AddItem
    func test_addItem() {
        let list = ["string1", "string2"]
        makeSUT(list: list).add(item: "")
        XCTAssertTrue(output.didAddItem)
    }
    
    func test_addItem_withRightItem() {
        let list = ["string1", "string2"]
        let item = "string3"
        makeSUT(list: list).add(item: item)
        XCTAssertEqual(output.capturedItemIndex, list.count)
    }
    
    //MARK: GetListCount
    func test_getListCount() {
        let list = ["string1", "string2"]
        XCTAssertEqual(makeSUT(list: list).getListCount(), list.count)
    }
    
    //MARK: Helpers
    func makeSUT(list: [String] = ["string1"]) -> DataStore<String> {
        let dataStore = DataStore<String>()
        dataStore.output = output
        list.forEach { item in
            dataStore.add(item: item)
        }
        return dataStore
    }
}
