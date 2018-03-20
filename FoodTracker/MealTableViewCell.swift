//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Wilson Campusano on 3/20/18.
//  Copyright © 2018 Wilson Campusano. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
	
	//MARK: UI properties
	@IBOutlet weak var photoImageView: UIImageView!
	
	@IBOutlet weak var nameLabel: UILabel!
	
	@IBOutlet weak var ratingControl: RatingControl!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
