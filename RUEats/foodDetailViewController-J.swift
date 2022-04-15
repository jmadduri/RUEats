//
//  foodDetailViewController-J.swift
//  RUEats
//
//  Created by Jithin Madduri on 4/8/22.
//

import UIKit

class foodDetailViewController_J: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var foodImagesCollectionView: UICollectionView!
    @IBOutlet weak var foodReviewsTableView: UITableView!
    @IBOutlet weak var foodImagesCollectionViewImage: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var campusNameLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var tableViewReviewLabel: UILabel!
    @IBOutlet weak var tableViewRatingLabel: UILabel!
    
    var reviews: [String] = ["Apple", "Banana", "Orange", "Pear", "Watermelon"]
    var ratings: [String] = ["5/5", "5/5", "5/5", "5/5", "5/5"]
    var reviewsDict: [String:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodImagesCollectionView.delegate = self
        foodImagesCollectionView.dataSource = self
        
        foodReviewsTableView.delegate = self
        foodReviewsTableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
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
