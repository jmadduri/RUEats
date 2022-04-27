//
//  ReviewRatingTableViewCell_j.swift
//  RUEats
//
//  Created by Jithin Madduri on 4/27/22.
//

import UIKit

class ReviewRatingTableViewCell_j: UITableViewCell {
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(review: Reviews){
        reviewLabel.text = review.review
        ratingLabel.text = review.rating
    }

}
