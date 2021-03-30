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
            let predicate = NSPredicate(format: "email = [c]%@", mail)
            if realm.objects(User.self).filter(predicate).first != nil{
                return true
            }else{
                return false
            }
        }catch{
            return false
        }
    }
}