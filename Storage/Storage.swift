//
//  Storage.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation
import RealmSwift

class Storage {
    
    private init() {}
    
    class func sharedInstance()->Storage{
        struct Singleton{
            static var shared = Storage()
        }
        return Singleton.shared
    }
    
    func save(user:User){
        do{
            let realm = try Realm()
            try realm.write(){
                realm.add(user)
            }
        }catch{
            
        }
    }
    
    func getAllUsers()->[User]{
        do{
            let realm = try Realm()
            return Array(realm.objects(User.self))
        }catch{
            return []
        }
    }
    
    func getUserByMail(mail:String)->Bool{
        do{
            let realm = try Realm()
            if let user = realm.objects(User.self).filter("email == \(mail)").first{
                return true
            }else{
                return false
            }
        }catch{
            return false
        }
    }
}
