//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/16/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate,
					  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	//MARK: UI properties
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var ratingControl: RatingControl!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	var meal: Meal?
	
	
	//MARK: Methods
	
	func updateSaveButton(){
		let text = nameTextField.text ?? ""
		saveButton.isEnabled = !text.isEmpty
	}
	
	
	//MARK: Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		
		guard let button = sender as? UIBarButtonItem, button === saveButton else {
			os_log("the save button was not pressed, cancelling", log: OSLog.default, type: .debug)
			return
		}
		
		let name = nameTextField.text ?? ""
		let rating = ratingControl.rating
		let photo = photoImageView.image
		
		meal = Meal(name: name, photo: photo, rating: rating)
		
	}
	
	//MARK: Actions

	@IBAction func cancel(_ sender: UIBarButtonItem) {
		dismiss(animated: false, completion: nil)
	}
	
	@IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
		// resign text field
		nameTextField.resignFirstResponder()
		let imagePickerController  = UIImagePickerController()
		imagePickerController.sourceType = .photoLibrary
		imagePickerController.delegate = self
		present(imagePickerController, animated: true, completion: myHandler)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		nameTextField.delegate = self
		updateSaveButton()
	}
	
	
	//MARK: Delegates
	func textFieldDidEndEditing(_ textField: UITextField) {
		updateSaveButton()
		navigationItem.title = textField.text
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		// this hide de keyboard and resign route event control.
		nameTextField.resignFirstResponder()
		return true
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: myHandler)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
			fatalError("expected a dictionary containing an image, but was \(info)")
		}
		
		photoImageView.image = selectedImage
		dismiss(animated: true, completion: myHandler)
	}

	
	
	let myHandler = {() -> Void in print("Hola Wilson") }
}
