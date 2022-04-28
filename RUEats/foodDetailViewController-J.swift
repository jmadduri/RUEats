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
    var ratings: [String] = ["5/5", "4/5", "3/5", "2/5", "1/5"]
    var foodCellDict: [FoodDetail] = []
    var reviewsDict: [Character:[String]] = [:]
    var reviewCellDict: [Character: [Reviews]] = [:]
    let cellScale: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodImagesCollectionView.delegate = self
        foodImagesCollectionView.dataSource = self
        foodReviewsTableView.delegate = self
        foodReviewsTableView.dataSource = self
        
        /*
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
         */
        
        //addCollectionFoodCell(insert: FoodDetail(image: UIImage(named: "apple")!))
        addCollectionFoodCell(insert: FoodDetail(image: UIImage(named: "apple1")!))
        addCollectionFoodCell(insert: FoodDetail(image: UIImage(named: "apple2")!))
        addCollectionFoodCell(insert: FoodDetail(image: UIImage(named: "apple3")!))
        
        for i in stride(from: 0, to: reviews.count, by: 1) {
            addReviewCell(insert: Reviews(review: reviews[i], rating: ratings[i]))
        }
        
        foodNameLabel.text = "Apple"
        foodPriceLabel.text = "$0.99"
        restaurantNameLabel.text = "Apple Store"
        campusNameLabel.text = "Livingston"
    }
    
    
    func addCollectionFoodCell(insert food: FoodDetail){
        foodCellDict.append(food)
        foodImagesCollectionView.reloadData()
    }
    
    func addReviewCell(insert food: Reviews){
        let firstLetter: Character = food.rating.first!
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodCellDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell_j", for: indexPath) as! CollectionViewCell_j
        let image = foodCellDict[indexPath.row]
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
