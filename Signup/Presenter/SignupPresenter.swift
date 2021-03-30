//
//  SignupPresenter.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation

protocol SignupPresenterProtocol {
    
    func validateSignup(firstName:String,lastName:String,age:String,mail:String,password:String)
    func saveUser(firstName:String,lastName:String,age:String,mail:String,password:String)
}

class SignupPresenter : SignupPresenterProtocol{
    
    var view : SignupViewProtocol?
    
    init(view:SignupViewProtocol) {
        self.view = view
    }
    
    func validateSignup(firstName:String,lastName:String,age:String,mail:String,password:String){
        
        guard let view = view else {return}
        
        //First Name
        if(firstName.isEmpty){
            view.showAlert(title: "First Name", message: "First Name isn't provided")
            return
        }
        
        if(firstName.count<2){
            view.showAlert(title: "First Name", message: "Minimum allowed characters are two")
            return
        }
        
        //Last Name
        if(lastName.isEmpty){
            view.showAlert(title: "Last Name", message: "Last Name isn't provided")
            return
        }
        
        if(lastName.count<2){
            view.showAlert(title: "Last Name", message: "Minimum allowed characters are two")
            return
        }
        
        guard !age.isEmpty, let age = Int(age) else {
            view.showAlert(title: "Age", message: "Age isn't provided")
            return
        }
        
        //Age
        if(age < 18){
            view.showAlert(title: "Age", message: "Age must be 18 or above")
            return
        }
        
        //Mail
        if(mail.isEmpty){
            view.showAlert(title: "Email", message: "Email isn't provided")
            return
        }
        
        if(!isValidEmail(mail)){
            view.showAlert(title: "Email", message: "Email isn't valid")
            return
        }
        
        if(isEmailExist(mail)){
            view.showAlert(title: "Email", message: "Email already exists")
            return
        }
        
        //Password
        if(password.isEmpty){
            view.showAlert(title: "Password", message: "Password isn't provided")
            return
        }
        
        if(password.count < 8){
            view.showAlert(title: "Password", message: "Password must be 8 or more characters long")
            return
        }
        
        if(!isValidPassword(password)){
            view.showAlert(title: "Password", message: "Password must contain Alphanumeric and Special Characters")
            return
        }
        
        view.saveUser()
    }
    
    func saveUser(firstName:String,lastName:String,age:String,mail:String,password:String){
        
        guard let view = view else {return}
        
        let user = User()
        user.firstName = firstName
        user.lastName = lastName
        user.age = Int(age)!
        user.email = mail
        user.password = password

        if(Storage.sharedInstance().save(user: user)){
            //Move to home Screen
            view.showAlert(title: "Registeration", message: "User created")
        }else{
            view.showAlert(title: "Registeration", message: "There is a problem with registeration, pleae try again later")
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isEmailExist(_ email: String) -> Bool{
        return Storage.sharedInstance().getUserByMail(mail: email) != nil 
    }
    
    func isValidPassword(_ password:String) -> Bool{
        let specialCharactersRegEx = ".*[^A-Za-z0-9].*"
        var passwordPred = NSPredicate(format:"SELF MATCHES %@", specialCharactersRegEx)
        let specialCharacters = passwordPred.evaluate(with: password)
        
        let numberRegEx  = ".*[0-9]+.*"
        passwordPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = passwordPred.evaluate(with: password)
        
        let letters = NSCharacterSet.letters
        let containsLetters = password.rangeOfCharacter(from: letters) != nil ? true : false
        
        return(containsLetters && specialCharacters && containsNumber)
    }
    
}
