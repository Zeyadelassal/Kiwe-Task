//
//  VenueModel.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation

struct VenueResponse:Codable {
    let meta: Meta
    let response: VenueData
}

struct Meta : Codable {
    let code: Int
    let requestID: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

struct VenueData : Codable {
    let venues: [Venue]
    let confident: Bool
}

struct Venue: Codable {
    let id, name: String
    let location: Location
    let categories: [Category]
    let referralID: String
    let hasPerk: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, location, categories
        case referralID = "referralId"
        case hasPerk
    }
}

struct Location : Codable {
    let address, crossStreet: String?
    let lat, lng: Double
    let labeledLatLngs: [LabeledCoordinate]?
    let distance: Int
    let cc: String?
    let city, state: String?
    let country: String?
    let formattedAddress: [String]
    let postalCode: String?
}

struct LabeledCoordinate: Codable {
    let label: String
    let lat, lng: Double
}

struct Category : Codable{
    let id, name, pluralName, shortName: String
    let icon: Icon
    let primary: Bool
}

struct Icon: Codable {
    let prefix, suffix: String
}



