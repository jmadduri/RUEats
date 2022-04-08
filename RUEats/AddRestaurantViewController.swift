//
//  AddRestaurantViewController.swift
//  RUEats
//
//  Created by William Wu on 4/6/22.
//

import UIKit
import SwiftUI

class AddRestaurantViewController: UIViewController {

    @IBOutlet weak var addRestaurantButton: UIButton!
    
    @IBSegueAction func showDetails(_ coder: NSCoder) -> UIViewController? {
        let addNewRestaurant = AddNewRestaurantUI()
        return UIHostingController(coder: coder, rootView: addNewRestaurant)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
