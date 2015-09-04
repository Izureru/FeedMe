//
//  MealItemTableViewCell.swift
//  FeedMe
//
//  Created by Izureru on 04/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit

class MealItemTableViewCell: UITableViewCell {

  @IBOutlet weak var TitleLabel: UILabel!
  @IBOutlet weak var NutritionLabel: UILabel!
  @IBOutlet weak var InfoLabel: UILabel!
  @IBOutlet weak var MealItemImageView: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
