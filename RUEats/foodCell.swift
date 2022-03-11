//
//  foodCell.swift
//  RUEats
//
//  Created by Jithin Madduri on 3/11/22.
//

import UIKit

class foodCell: UITableViewCell {

    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodRatingLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(food: Food){
        foodPriceLabel.text = food.price
        foodRatingLabel.text = food.rating
        foodImage.image = food.image
        foodNameLabel.text = food.name
    }
}
