//
//  LoginPageViewController.swift
//  RUEats
//
//  Created by William Wu on 4/28/22.
//

import UIKit

class LoginPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var netIDTextLabel: UILabel!
    @IBOutlet weak var passwordTextLabel: UILabel!
    
    @IBOutlet weak var netIDTextField: UITextField!
    @IBOutlet weak var loginPageUIView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPageUIView.makeCircle()
        netIDTextField.delegate = self
        passwordTextField.delegate = self
//        loginPageUIView.layer.shadowPath = UIBezierPath(roundedRect: loginPageUIView.bounds, cornerRadius: 10).cgPath
    }
    
    @IBAction func SignInButtonTapped(_ sender: Any) {
    }
    
    @IBAction func NewToRUEatsButtonTapped(_ sender: Any) {
    }
    
}
extension UIImageView{
    func makeCircle() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
    }
}
    

