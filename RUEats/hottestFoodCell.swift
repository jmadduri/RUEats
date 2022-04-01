//
//  hottestFoodCell.swift
//  RUEats
//
//  Created by William Wu on 4/1/22.
//

import UIKit

class hottestFoodCell: UICollectionViewCell {
    
    @IBOutlet weak var foodDisplayImageView: UIImageView!
    @IBOutlet weak var foodDisplayLabel: UILabel!
    
    static let identifier = "hottestFoodCell"
    
    //MARK: this should be -> func setUpCell(food: foodDisplay)
    func setUpCell(food: foodDisplay){
        self.foodDisplayLabel.text =  food.label
        self.foodDisplayImageView.image = food.image
    }
}
