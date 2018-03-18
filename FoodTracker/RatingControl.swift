//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/18/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

	
	//MARK: initialization
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupButtons()
	}
	
	required init(coder: NSCoder) {
		super.init(coder: coder)
		setupButtons()
	}
	
	//MARK: private methods
	
	private func setupButtons(){
		let button = UIButton()
		button.backgroundColor = .red
		button.translatesAutoresizingMaskIntoConstraints = false
		button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
		button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
		addArrangedSubview(button)
	}
}
