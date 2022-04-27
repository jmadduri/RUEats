//
//  foodDetailViewController-J.swift
//  RUEats
//
//  Created by Jithin Madduri on 4/8/22.
//

import UIKit

class foodDetailViewController_J: UIViewController, UITableViewDelegate, UITableViewDataSource,
                                  UICollectionViewDelegate, UICollectionViewDataSource
{

    @IBOutlet weak var foodImagesCollectionView: UICollectionView!
    @IBOutlet weak var foodReviewsTableView: UITableView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var campusNameLabel: UILabel!
    
    var reviews: [String] = ["I thought the food was great!", "I thought the food was great!", "I thought the food was great!", "I thought the food was great!", "I thought the food was great!"]
    var ratings: [String] = ["5/5", "5/5", "5/5", "5/5", "5/5"]
    var foodCellDict: [FoodDetail] = []
    var reviewsDict: [Character:[String]] = [:]
    var reviewCellDict: [Character: [Reviews]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodImagesCollectionView.delegate = self
        foodImagesCollectionView.dataSource = self
        
        addCollectionFoodCell(insert: FoodDetail(image: UIImage(named: "apple")!))
        addCollectionFoodCell(insert: FoodDetail(image: UIImage(named: "apple1")!))
        addCollectionFoodCell(insert: FoodDetail(image: UIImage(named: "apple2")!))
        addCollectionFoodCell(insert: FoodDetail(image: UIImage(named: "apple3")!))
    
        foodReviewsTableView.delegate = self
        foodReviewsTableView.dataSource = self
    }
    
    
    func addCollectionFoodCell(insert food: FoodDetail){
        foodCellDict.append(food)
        foodImagesCollectionView.reloadData()
    }
    
    func addReviewCell(insert food: Reviews){
        let firstLetter: Character = food.review.first!
        var currentList = (reviewCellDict[firstLetter] == nil) ? [] : reviewCellDict[firstLetter]!
        currentList.append(food)
        reviewCellDict[firstLetter] = currentList
        foodReviewsTableView.reloadData()
    }
    
    func sortReviews() {
        for rating in ratings {
            let firstLetter: Character = rating.first!
            var currentList = (reviewsDict[firstLetter] == nil) ? [] : reviewsDict[firstLetter]!
            currentList.append(rating)
            reviewsDict[firstLetter] = currentList
        }
    }
    
    @IBAction func mapButton(_ sender: UIButton) {
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
    }
    
    @IBAction func callButton(_ sender: UIButton) {
        callNumber(phoneNumber: "Enter Phone Number Here")
    }
    
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func getFoodsAtSectionRow(section: Int, row: Int) -> String{
        let letter = reviewsDict.keys.sorted()[section]
        let list = reviewsDict[letter]!
        return list[row]
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(reviewCellDict.keys.sorted()[section])"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return reviewCellDict.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = reviewCellDict.keys.sorted()[section]
        let list = reviewCellDict[letter]!
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodReviewsTableView.dequeueReusableCell(withIdentifier: "ReviewRatingTableViewCell_j", for: indexPath) as! ReviewRatingTableViewCell_j
        let letter = reviewCellDict.keys.sorted()[indexPath.section]
        let list = reviewCellDict[letter]!
        let review = list[indexPath.row]
        cell.setUpCell(review: review)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodCellDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell_j", for: indexPath) as! CollectionViewCell_j
        let image = foodCellDict[indexPath.item]
        cell.setUpCollectionViewCell(food: image)
        return cell
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
