//
//  FoodViewController.swift
//  RUEats
//
//  Created by Jithin Madduri on 3/11/22.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var foodListTableView: UITableView!
    @IBOutlet weak var foodSearchBar: UISearchBar!
    
    var foods: [String] = ["Apple", "Banana", "Orange", "Pear", "Watermelon"]
    var filteredFoods: [String] = []
    var foodsDict: [Character:[String]] = [:]
    
    var foodCellDict: [Character: [Food]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        foodListTableView.delegate = self
        foodListTableView.dataSource = self
        
        addFoodCell(insert: Food(name: "Apple", image: UIImage(named: "apple")!, price: "$0.00", rating: "5/5"))
        addFoodCell(insert: Food(name: "Banana", image: UIImage(named: "banana")!, price: "$0.00", rating: "5/5"))
        addFoodCell(insert: Food(name: "Orange", image: UIImage(named: "orange")!, price: "$0.00", rating: "5/5"))
        addFoodCell(insert: Food(name: "Pear", image: UIImage(named: "pear")!, price: "$0.00", rating: "5/5"))
        addFoodCell(insert: Food(name: "Watermelon", image: UIImage(named: "watermelon")!, price: "$0.00", rating: "5/5"))

        sortNames()
        
        foodSearchBar.delegate = self
        filteredFoods = foods
        // Do any additional setup after loading the view.
    }
    
    func addFoodCell(insert food: Food){
        let firstLetter: Character = food.name.lowercased().first!
        var currentList = (foodCellDict[firstLetter] == nil) ? [] : foodCellDict[firstLetter]!
        currentList.append(food)
        foodCellDict[firstLetter] = currentList
        foodListTableView.reloadData()
    }
    
    func sortNames() {
        for food in foods{
            let firstLetter: Character = food.lowercased().first!
            var currentList = (foodsDict[firstLetter] == nil) ? [] : foodsDict[firstLetter]!
            currentList.append(food)
            foodsDict[firstLetter] = currentList
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(foodCellDict.keys.sorted()[section])".uppercased()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodCellDict.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = foodCellDict.keys.sorted()[section]
        let list = foodCellDict[letter]!
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodListTableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! foodCell
        let letter = foodCellDict.keys.sorted()[indexPath.section]
        let list = foodCellDict[letter]!
        let food = list[indexPath.row]
        cell.setUpCell(food: food)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "didTapFoodItemCell", sender: self)
    }
    
    func getFoodsAtSectionRow(section: Int, row: Int) -> String{
        let letter = foodsDict.keys.sorted()[section]
        let list = foodsDict[letter]!
        return list[row]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredFoods = []
        if(searchText == ""){
            filteredFoods = foods
        }
        else{
            for food in foods{
                if(food.lowercased().contains(searchText.lowercased())){
                    filteredFoods.append(food)
                }
            }
        }
        foodListTableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
