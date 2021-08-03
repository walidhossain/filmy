//
//  FilmyUITests.swift
//  FilmyUITests
//
//  Created by Walid Hossain on 2/8/21.
//

import XCTest

class FilmyUITests: XCTestCase {

    var app : XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.activate()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearchAndDetails() throws {
        let searchField = app.navigationBars["Movie List"].searchFields["Search"]
        searchField.tap()
        searchField.typeText("Batman v Superman: Dawn of Justice")
        app.keyboards.buttons["Search"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts["Batman v Superman: Dawn of Justice"].tap()
        elementsQuery.staticTexts["2016"].tap()
                                
    }
}
