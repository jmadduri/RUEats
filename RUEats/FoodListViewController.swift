//
//  FoodListViewController.swift
//  RUEats
//
//  Created by Jithin Madduri on 3/4/22.
//

import UIKit

class FoodListViewController: UIViewController, UITableViewDataSource{
    var foodsList: [String] = ["Apple", "Orange", "Pear", "Banana"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //foodListTableView.delegate = self
        //foodListTableView.dataSource = self
    }
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
