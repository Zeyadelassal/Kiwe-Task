//
//  LoginViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

protocol LoginViewProtocol : Alertable {
    
}

class LoginViewController: UIViewController, LoginViewProtocol {
    
    @IBOutlet weak var mailTextField: customUITextField!
    @IBOutlet weak var passwordTextField: customUITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(Storage.sharedInstance().getAllUsers())
    }
    
    @IBAction func login(_ sender: Any) {
        print(Storage.sharedInstance().getUserByMail(mail: mailTextField.text ?? ""))
    }
    @IBAction func forgetPassword(_ sender: Any) {
        print("FORGET PASSWORD")
    }
    
    @IBAction func createNewAccount(_ sender: Any){
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }
}
