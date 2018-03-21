//
//  Meal.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/19/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//
import UIKit

public class Meal : NSObject, NSCoding {
	
	static var DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
	static var ArchiveURL =  DocumentDirectory.appendingPathComponent("meals")
	
	var name:String
	var photo: UIImage?
	var rating: Int
	
	enum PropertyKey: String {
		case name, photo, rating
	}
	
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(self.name, forKey: PropertyKey.name.rawValue)
		aCoder.encode(self.photo, forKey: PropertyKey.photo.rawValue)
		aCoder.encode(self.rating, forKey: PropertyKey.rating.rawValue)
	}
	
	
	public required convenience init?(coder aDecoder: NSCoder) {
		guard let name = aDecoder.decodeObject(forKey: PropertyKey.name.rawValue) as? String else {
				fatalError("cannot decode name")
		}
		let photo = aDecoder.decodeObject(forKey: PropertyKey.photo.rawValue) as? UIImage
		let rating =  aDecoder.decodeInteger(forKey: PropertyKey.rating.rawValue)
		
		self.init(name: name, photo: photo, rating: rating)
	}

	init?(name: String, photo: UIImage?, rating: Int){
		guard !name.isEmpty,  !(rating < 0), (rating >= 0 && rating <= 5) else {
			return nil
		}
		self.name = name
		self.photo = photo
		self.rating = rating
	}
}
