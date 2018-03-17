//
//  FoodTrackerUITests.swift
//  FoodTrackerUITests
//
//  Created by Wilson Campusano on 3/17/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import XCTest

class FoodTrackerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
	
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testClickAfterEnterMeal() {
		
		let app = XCUIApplication()
		let enterMealNameTextField = app.textFields["Enter meal name"]
		enterMealNameTextField.tap()
		enterMealNameTextField.typeText("wilson")
		app.buttons["Set Default Label Text"].tap()
		
    }
    
}
