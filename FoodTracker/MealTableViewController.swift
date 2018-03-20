//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/20/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
	private var meals = [Meal]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
	

		//MARK: methods
		
		func loadSampleMeals(){
			guard let m1 = Meal(name: "Meal 1 ", photo: #imageLiteral(resourceName: "meal1"), rating: 4),
				let m2 =  Meal(name: "Meal 2 ", photo: #imageLiteral(resourceName: "meal2"), rating: 5),
				let m3 = Meal(name: "Meal 3 ", photo: #imageLiteral(resourceName: "meal3"), rating: 2) else {
					fatalError("error creating sample meals")
			}
			
			meals += [m1, m2, m3]
		}
}
