//
//  FoodCell.swift
//  RUEats
//
//  Created by William Wu on 3/1/22.
//

import UIKit

class FoodCell: UICollectionViewCell {
    
    @IBOutlet weak var foodDisplayImageView: UIImageView!
    @IBOutlet weak var foodDisplayLabel: UILabel!
    
    static let identifier = "FoodCell"
    
    //MARK: this should be -> func setUpCell(food: foodDisplay)
    func setUpCell(food: foodDisplay){
        self.foodDisplayLabel.text =  food.label
        self.foodDisplayImageView.image = food.image
    }
}

