//
//  LoginPresenter.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation

protocol LoginPresenterProtocol {}

class LoginPresenter{
    
    
    
    func validateLogin(email:String,password:String){
        if (email.isEmpty){
            
        }
        
        if(!isValidEmail(email: email)){
            
        }
        
        if(password.isEmpty){
            
        }
        
        
    }
    
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
}
