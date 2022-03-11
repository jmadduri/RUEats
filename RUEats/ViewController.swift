//
//  ViewController.swift
//  RUEats
//
//  Created by Jithin Madduri on 2/25/22.
//

//aryan was here

import UIKit

struct foodDisplay{
    var image: UIImage
    var label: String
}

class ViewController: UIViewController {

    // Size has to be non-automatic 
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    let foodNames : [String] = ["Burgers", "Pizza", "Pasta", "Asian", "Takeout"]
    
    var food : [foodDisplay] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        for i in 0..<foodNames.count{
            // adds the images to the empty food array
            food.append(foodDisplay(image: UIImage(named: "food\(i)")!, label: foodNames[i]))
        }
    }
}

extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Alows for deselection
        foodCollectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodNames.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCell.identifier, for: indexPath) as! FoodCell
        
        cell.setUpCell(food: food[indexPath.row])
        return cell
        
    }
}

// Allows for cell customization: Margin and padding between each cell
//extension ViewController: UICollectionViewFlowLayout{
//
//}

