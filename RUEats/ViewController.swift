//
//  ViewController.swift
//  RUEats
//
//  Created by William Wu on 2/25/22.
//

//aryan was here

import UIKit

struct foodDisplay{
    var image: UIImage
    var label: String
}


class ViewController: UIViewController {

    @IBOutlet weak var restaurantTableView: UITableView!
    // Size has to be non-automatic 
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    @IBOutlet weak var testUIButton: UIButton!
    
    
    
    let dummyRestaurants = ["Chipotle", "Panera", "Moe's", "Wawa", "McDonalds"]
    
    let foodNames : [String] = ["Burgers", "Pizza", "Pasta", "Asian", "Takeout"]
    
    var food : [foodDisplay] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        for i in 0..<foodNames.count{
            // adds the images to the empty food array
            food.append(foodDisplay(image: UIImage(named: "food\(i)")!, label: foodNames[i]))
        }
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("works!")
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyRestaurants.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurantTableView.dequeueReusableCell(withIdentifier: "restaurantProtypeCell", for: indexPath)
        cell.textLabel?.text = dummyRestaurants[indexPath.row]
        
        return cell
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hottestFoodCell.identifier, for: indexPath) as! hottestFoodCell
        
        cell.setUpCell(food: food[indexPath.row])
        return cell
        
    }
}

// Allows for cell customization: Margin and padding between each cell
//extension ViewController: UICollectionViewFlowLayout{
//
//}

