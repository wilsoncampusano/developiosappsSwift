//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/18/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
	
	//MARK: properties
	
	private var buttons = [UIButton]()
	var rating = 0
	@IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
		didSet{
			setupButtons()
		}
	}
	@IBInspectable var starCount: Int = 5 {
		didSet{
			setupButtons()
		}
	}

	
	//MARK: initialization
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		//setupButtons()
	}
	
	required init(coder: NSCoder) {
		super.init(coder: coder)
		//setupButtons()
	}
	
	//MARK: actions
	
	@objc func ratingButtonTapped(button: UIButton){
		print("button pressed 👍")
	}
	
	//MARK: private methods
	
	private func setupButtons(){
		removeButtons()
		for _ in 0..<starCount{
			
			let button = UIButton()
			button.backgroundColor = .red
			button.translatesAutoresizingMaskIntoConstraints = false
			button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
			button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
			
			button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
			
			// this is not necesary because buttons were removed on initializers
			buttons.append(button)
			addArrangedSubview(button)
		}
	}
	
	private func removeButtons(){
		for b in buttons{
			removeArrangedSubview(b)
		}
		buttons.removeAll()
	}
}
