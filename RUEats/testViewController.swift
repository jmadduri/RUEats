//
//  testViewController.swift
//  RUEats
//
//  Created by William Wu on 4/10/22.
//

import UIKit
import SwiftUI

class testViewController: UIViewController {

    @IBAction func TestLoginUIButton(_ sender: Any) {
    }
    
    @IBAction func whateverButton(_ sender: Any) {
    }
    
    @IBSegueAction func showLoginDetailsSegue(_ coder: NSCoder) -> UIViewController? {
        let loginUser = loginUserUI()
        return UIHostingController(coder: coder, rootView: loginUser)
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
