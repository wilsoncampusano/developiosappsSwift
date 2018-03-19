//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Wilson Campusano on 3/16/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    

	func testMealInitializationSucceeds(){
		let zeroRatingMeal = Meal(name: "Zero", photo: nil, rating: 0)
		XCTAssertNotNil(zeroRatingMeal)
		
		let positiveRatingMeal = Meal(name:"Positive", photo: nil, rating: 0)
		XCTAssertNotNil(positiveRatingMeal)
	}
	
	func testMealInitializationFails(){
		
		let negativeRatingMeal = Meal(name: "Negative", photo: nil, rating: -1)
		XCTAssertNil(negativeRatingMeal)
		
		let emptyRatingMeal = Meal(name: "", photo: nil, rating: 4)
		XCTAssertNil(emptyRatingMeal)
		
		
		let largeRatingMEal = Meal(name: "Large", photo: nil, rating: 9)
		XCTAssertNil(largeRatingMEal)
	}
}
