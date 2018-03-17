//
//  ViewController.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/16/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

	//MARK: UI properties
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var mealNameLabel: UILabel!
	
	
	//MARK: Actions
	@IBAction func setDefaultLabelText(_ sender: UIButton) {
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		nameTextField.delegate = self
	}
	
	
	//MARK: Delegates
	func textFieldDidEndEditing(_ textField: UITextField) {
		//this is called after the textfield resign control.
		mealNameLabel.text = nameTextField.text
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		// this hide de keyboard and resign route event control.
		nameTextField.resignFirstResponder()
		return true
	}

}
