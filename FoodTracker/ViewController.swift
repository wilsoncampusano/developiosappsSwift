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
		mealNameLabel.text = nameTextField.text
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		nameTextField.delegate = self
	}
	
	
	//MARK: Delegates
	func textFieldDidEndEditing(_ textField: UITextField) {
		
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nameTextField.resignFirstResponder()
		return true
	}

}
