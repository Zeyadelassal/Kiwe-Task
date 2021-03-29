//
//  UserModel.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation
import RealmSwift

class User : Object {
        
    @objc dynamic var firstName : String = ""
    @objc dynamic var lastName : String = ""
    @objc dynamic var age : Int = 0
    @objc dynamic var email : String = ""
    @objc dynamic var password : String = ""

}


