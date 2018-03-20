//
//  Meal.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/19/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//
import UIKit

public class Meal {
	var name:String
	var photo: UIImage?
	var rating: Int
	
	init?(name: String, photo: UIImage?, rating: Int){
		guard !name.isEmpty,  !(rating < 0), (rating >= 0 && rating <= 5) else {
			return nil
		}
		self.name = name
		self.photo = photo
		self.rating = rating
	}
}
