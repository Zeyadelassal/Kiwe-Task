//
//  LoginViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

protocol LoginViewProtocol : Alertable {
    func loginUser()
}

class LoginViewController: UIViewController, LoginViewProtocol {
    
    var presenter : LoginPresenterProtocol?
    
    @IBOutlet weak var mailTextField: customUITextField!
    @IBOutlet weak var passwordTextField: customUITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
    }
    
    func loginUser(){
        let email = mailTextField.text!
        let password = passwordTextField.text!
        presenter?.login(email:email, password: password)
    }
    
    @IBAction func login(_ sender: Any) {
        let email = mailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        presenter?.validateLogin(email: email, password: password)
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        print("FORGET PASSWORD")
    }
    
    @IBAction func createNewAccount(_ sender: Any){
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }
}
