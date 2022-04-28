//
//  CollectionViewCell_j.swift
//  RUEats
//
//  Created by Jithin Madduri on 4/22/22.
//

import UIKit

class CollectionViewCell_j: UICollectionViewCell {
    @IBOutlet weak var collectionViewCellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCollectionViewCell(food: FoodDetail){
        collectionViewCellImageView.image = food.image
    }
}
