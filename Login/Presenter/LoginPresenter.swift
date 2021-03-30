//
//  LoginPresenter.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation

protocol LoginPresenterProtocol {
    func validateLogin(email:String,password:String)
    func login(email:String,password:String)
}

class LoginPresenter : LoginPresenterProtocol{
    
    var view : LoginViewProtocol?
    
    init(view : LoginViewProtocol) {
        self.view = view
    }
    
    func validateLogin(email:String,password:String){
        
        guard let view = view else {return}
        
        if (email.isEmpty){
            view.showAlert(title: "Email", message: "Email isn't provided")
            return
        }
        
        if(!isValidEmail(email: email)){
            view.showAlert(title: "Email", message: "Email isn't valid")
            return
        }
        
        if(password.isEmpty){
            view.showAlert(title: "Password", message: "Password isn't provided")
            return
        }
        
        view.loginUser()
    }
    
    func login(email:String,password:String){

        guard let view = view else {return}
        
        let user = Storage.sharedInstance().getUserByMail(mail: email)
        if let user = user{
            if(password == user.password){
                view.showAlert(title: "Login", message: "Logged")
            }else{
                view.showAlert(title: "Login", message: "The email or password is invalid")
            }
        }else{
            view.showAlert(title: "Login", message: "User isn't found")
        }
    }
    
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
}
