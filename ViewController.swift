//
//  ViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Network.sharedInstance().getMethod(url: WebServiceURL.getVenues, parameters: parameters, headers: nil) { (error, response:VenueResponse?) in
            print(response?.response)
        }
    }
    
    let parameters = [WebServiceParameterKeys.coordinate : "29.976480,31.131302" ,WebServiceParameterKeys.clientID : AppConfig.clientIDKey,
                      WebServiceParameterKeys.clientSecret : AppConfig.clientSecrectKey,
                      WebServiceParameterKeys.v : AppConfig.vKey]
    
    
}

