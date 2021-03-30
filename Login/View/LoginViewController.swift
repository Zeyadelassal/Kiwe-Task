//
//  LoginViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

protocol LoginViewProtocol : Alertable {
    func loginUser()
    func moveToHomeView()
}

class LoginViewController: UIViewController, LoginViewProtocol {
    
    var presenter : LoginPresenterProtocol?
    
    @IBOutlet weak var mailTextField: customUITextField!
    @IBOutlet weak var passwordTextField: customUITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func loginUser(){
        let email = mailTextField.text!
        let password = passwordTextField.text!
        presenter?.login(email:email, password: password)
    }
    
    func moveToHomeView(){
        navigationController?.pushViewController(HomeViewController(), animated: true)
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
