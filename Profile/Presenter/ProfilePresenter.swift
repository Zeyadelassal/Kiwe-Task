//
//  ProfilePresenter.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/31/21.
//

import Foundation


protocol ProfilePresenterProtocol {
    func getUser(mail:String)
    func getUserName()->String
    func getUserEmail()->String
    func getUserAge()->String
}

class ProfilePresenter : ProfilePresenterProtocol{
    
    var view : ProfileViewProtocol?
    var user = User()
    
    init(view:ProfileViewProtocol) {
        self.view = view
    }
    
    func getUser(mail:String){
        user = Storage.sharedInstance().getUserByMail(mail: mail) ?? User()
    }

    func getUserName()->String{
        return user.firstName + " " + user.lastName
    }
    
    func getUserEmail()->String{
        return user.email
    }
    
    func getUserAge()->String{
        return String(user.age)
    }
}
