//
//  AddFoodViewController.swift
//  RUEats
//
//  Created by Jithin Madduri on 4/15/22.
//

import UIKit

class AddFoodViewController: UIViewController {

    
    @IBOutlet weak var newFoodTextField: UITextField!
    @IBOutlet weak var newFoodDescriptionTextField: UITextField!
    @IBOutlet weak var newFoodRatingTextField: UITextField!
    
    @IBAction func didTapAddButton(_ sender: UIButton) {
        if (newFoodTextField.text != "") && (newFoodDescriptionTextField.text != "") && (newFoodRatingTextField.text != "") {
            showToast(controller: self, message : "All the fields Are Not filled. Try Again.", seconds: 2.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newFoodDescriptionTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15

        controller.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
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
