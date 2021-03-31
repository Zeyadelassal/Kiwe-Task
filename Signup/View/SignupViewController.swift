//
//  SignupViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

protocol SignupViewProtocol : Alertable{
    func saveUser()
}

class SignupViewController: UIViewController, SignupViewProtocol, UITextFieldDelegate{
    
    var presenter : SignupPresenterProtocol?

    @IBOutlet weak var firstNameTextField: customUITextField!
    @IBOutlet weak var lastNameTextField: customUITextField!
    @IBOutlet weak var ageTextField: customUITextField!
    @IBOutlet weak var mailTextField: customUITextField!
    @IBOutlet weak var passwordTextField: customUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        ageTextField.delegate = self
        mailTextField.delegate = self
        passwordTextField.delegate = self
        presenter = SignupPresenter(view: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
       }

    func saveUser(){
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let age = ageTextField.text!
        let email = mailTextField.text!
        let password = passwordTextField.text!
        presenter?.saveUser(firstName: firstName, lastName: lastName, age: age, mail: email, password: password)
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signup(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let age = ageTextField.text ?? ""
        let email = mailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        presenter?.validateSignup(firstName: firstName, lastName: lastName, age: age, mail: email, password: password)
    }
}
