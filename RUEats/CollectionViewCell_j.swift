//
//  CollectionViewCell_j.swift
//  RUEats
//
//  Created by Jithin Madduri on 4/22/22.
//

import UIKit

class CollectionViewCell_j: UICollectionViewCell {
    @IBOutlet weak var collectionViewCellImageView: UIImageView!
    @IBOutlet weak var collectionViewCellPriceLabel: UILabel!
    @IBOutlet weak var collectionViewCellRestaurantLabel: UILabel!
    @IBOutlet weak var collectionViewCellCampusLabel: UILabel!
    @IBOutlet weak var collectionViewCellNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCollectionViewCell(food: FoodDetail){
        collectionViewCellPriceLabel.text = food.price
        collectionViewCellRestaurantLabel.text = food.restaurant
        collectionViewCellImageView.image = food.image
        collectionViewCellNameLabel.text = food.name
        collectionViewCellCampusLabel.text = food.campus
    }
}
