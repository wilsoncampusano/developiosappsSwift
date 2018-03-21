//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/20/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController {
	private var meals = [Meal]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		loadSampleMeals()
    }
	
	//MARK: table view configuration
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "MealTableViewCell"
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
				fatalError("dequeeing cell on \(type(of: self))")
		}
		
		let meal = meals[indexPath.row]
		
		cell.nameLabel.text = meal.name
		cell.ratingControl.rating = meal.rating
		cell.photoImageView.image = meal.photo
		
		return cell
	
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return meals.count
	}
	
	//MARK: actions

	@IBAction func unwindToMealList(sender: UIStoryboardSegue){
		
		if let sourceViewController = sender.source as? MealViewController,
			let meal = sourceViewController.meal {
			let newIndexPath = IndexPath(row: meals.count, section: 0)
			
			meals.append(meal)
			
			tableView.insertRows(at: [newIndexPath], with: .automatic)
		}
		
	}

	//MARK: methods
	func loadSampleMeals(){
		guard let m1 = Meal(name: "Meal 1 ", photo: #imageLiteral(resourceName: "meal1"), rating: 3),
				let m2 =  Meal(name: "Meal 2 ", photo: #imageLiteral(resourceName: "meal2"), rating: 5),
				let m3 = Meal(name: "Meal 3 ", photo: #imageLiteral(resourceName: "meal3"), rating: 2) else {
					fatalError("error creating sample meals")
		}
		
		meals += [m1, m2, m3]
	}
	
	//MARK: SEGUE
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		
		switch segue.identifier ?? "" {
			case "AddItem":
				os_log("ADDING ITEM", log: OSLog.default, type: .debug)
			case "ShowDetail":
				guard let controller =  segue.destination as? MealViewController,
					  let cell = sender as? MealTableViewCell,
					  let indexPath = tableView.indexPath(for: cell)
				else{
					fatalError("error obtening index")
				}
				let meal = meals[indexPath.row]
				controller.meal = meal
			default:
				fatalError("ERROR EN SEGUE")
			}
	}
}
