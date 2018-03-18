//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/18/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
	
	//MARK: properties
	
	private var buttons = [UIButton]()
	var rating = 0

	
	//MARK: initialization
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupButtons()
	}
	
	required init(coder: NSCoder) {
		super.init(coder: coder)
		setupButtons()
	}
	
	//MARK: actions
	
	@objc func ratingButtonTapped(button: UIButton){
		print("button pressed 👍")
	}
	
	//MARK: private methods
	
	private func setupButtons(){
		
		for _ in 0..<5{
			
			let button = UIButton()
			button.backgroundColor = .red
			button.translatesAutoresizingMaskIntoConstraints = false
			button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
			button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
			
			button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
			
			addArrangedSubview(button)
		}
		
	
	}
}
