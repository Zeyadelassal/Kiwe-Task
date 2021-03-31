//
//  LoginViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit
import Kingfisher

protocol LoginViewProtocol : Alertable {
    func loginUser()
    func moveToHomeView()
}

class LoginViewController: UIViewController, LoginViewProtocol, UITextFieldDelegate{
    
    var presenter : LoginPresenterProtocol?
    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var mailTextField: customUITextField!
    @IBOutlet weak var passwordTextField: customUITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
        let imageURL = URL(string:        "https://ss3.4sqi.net/img/categories_v2/shops/mobilephoneshop_64.png")!
        let resource = ImageResource(downloadURL: imageURL)
        let placeHolder = UIImage(named: "image_placeholder")
        self.testImage.kf.indicatorType = .activity
        self.testImage.kf.setImage(with: resource, placeholder: placeHolder)
        mailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
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
        let homeVC = HomeViewController()
        homeVC.userMail = mailTextField.text!
        navigationController?.pushViewController(homeVC, animated: true)
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
    
    override func viewWillDisappear(_ animated: Bool) {
        mailTextField.text = ""
        passwordTextField.text = ""
    }
}
