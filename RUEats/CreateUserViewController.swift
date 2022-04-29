//
//  CreateUserViewController.swift
//  RUEats
//
//  Created by William Wu on 4/29/22.
//

import UIKit

class CreateUserViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var netIDTextField: UITextField!
    @IBOutlet weak var rutgersEmailTextField: UITextField!
    @IBOutlet weak var createPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        netIDTextField.delegate = self
        rutgersEmailTextField.delegate = self
        createPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createNewUserButtonTapped(_ sender: Any) {
    }
    
   

}
