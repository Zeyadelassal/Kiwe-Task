//
//  Network.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation
import Alamofire

class Network{
    
    private init() {}
    
    class func sharedInstance()->Network{
        struct Singleton{
            static var shared = Network()
        }
        return Singleton.shared
    }
    
    func getMethod<T:Codable>(url:String,parameters:[String:Any]?,headers:[String:String]?,completionForGETMethod:@escaping(_ error:String?,_ response:T?)->Void){
        
        let urlHeaders = headers != nil ? HTTPHeaders(headers!) : nil
        print("URL",WebServiceURL.baseURL + url)
        AF.request(WebServiceURL.baseURL + url,parameters: parameters)
            .validate()
            .responseDecodable(of: T.self) { (response) in
                print("response \(response)")
                if let error = response.error {
                    completionForGETMethod(error.errorDescription,nil)
                }else{
                    print(response.value)
                    completionForGETMethod(nil,response.value)
                }
            }
    }
}

