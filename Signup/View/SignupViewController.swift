//
//  SignupViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

protocol SignupProtocol{}

class SignupViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: customUITextField!
    @IBOutlet weak var lastNameTextField: customUITextField!
    @IBOutlet weak var ageTextField: customUITextField!
    @IBOutlet weak var mailTextField: customUITextField!
    @IBOutlet weak var passwordTextField: customUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signup(_ sender: Any) {
        let user = User()
        user.firstName = firstNameTextField.text ?? ""
        user.lastName = lastNameTextField.text ?? ""
        user.age = Int(ageTextField.text ?? "") ?? 0
        user.email = mailTextField.text ?? ""
        user.password = passwordTextField.text ?? ""
        
        Storage.sharedInstance().save(user: user)
    }
    
}
