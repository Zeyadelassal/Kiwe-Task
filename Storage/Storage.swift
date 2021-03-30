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
    
    func save(user:User) -> Bool{
        do{
            let realm = try Realm()
            try realm.write(){
                realm.add(user)
            }
            return true
        }catch{
            return false
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
    
    func getUserByMail(mail:String)->User?{
        do{
            let realm = try Realm()
            let predicate = NSPredicate(format: "email = [c]%@", mail)
            return realm.objects(User.self).filter(predicate).first
        }catch{
            return nil
        }
    }
}
