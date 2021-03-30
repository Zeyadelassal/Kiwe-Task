//
//  WebService.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation

struct WebServiceURL {
    static let baseURL = "https://api.foursquare.com/v2"
    static let getVenues = "/venues/search"
}

struct WebServiceParameterKeys {
    static let coordinate = "ll"
    static let clientID = "client_id"
    static let clientSecret = "client_secret"
    static let v = "v"
}



