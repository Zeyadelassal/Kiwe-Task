//
//  HomePresenter.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation
import CoreLocation

protocol HomePresenterProtocol {
    func getNearbyVenues(coordinate:String)
    func getVenuesCount() -> Int
    func getVenue(at index:Int) -> Venue
    func configureCell(cell:VenuesCollectionViewCellProtocol,indexPath:Int)
    func getVenueAddress(indexPath:Int)->String
    func getVenueCoordinate(index:Int)->CLLocationCoordinate2D
}

class HomePresenter: HomePresenterProtocol{

    var view : HomeViewProtocol?
    var venues = [Venue]()
    var venuesCoordinates = [CLLocationCoordinate2D]()
    
    init(view:HomeViewProtocol) {
        self.view = view
    }
    
    func getNearbyVenues(coordinate:String){
        let parameters = createNearbyVenuesParameters(coordinate: coordinate)
        Network.sharedInstance().getMethod(url: WebServiceURL.getVenues, parameters: parameters, headers: nil) { [weak self](error, response:VenueResponse?) in
            guard error == nil else{
                self?.view?.showAlert(title: "Network connection", message: "Check your connection")
                return
            }
            if let venueData = response?.response{
                self?.venues.removeAll()
                self?.venues = venueData.venues
                self?.createCoordinates()
                self?.view?.reload()
            }
        }
    }
    
    func getVenuesCount() -> Int{
        return venues.count
    }
    
    func getVenue(at index:Int) -> Venue{
        return venues[index]
    }
    
    func getVenueAddress(indexPath:Int)->String{
        return venues[indexPath].location.address ?? ""
    }
    
    func getVenueCoordinate(index: Int) -> CLLocationCoordinate2D {
        return venuesCoordinates[index]
    }



    func configureCell(cell: VenuesCollectionViewCellProtocol, indexPath: Int) {
        cell.setVenueName(venueName: venues[indexPath].name)
        cell.setVenueAddress(venueAddress: venues[indexPath].location.address ?? "")
        cell.setVenueCatName(venueCatName: venues[indexPath].categories.first?.name ?? "No category available")
        let venueCatImage = (venues[indexPath].categories.first?.icon.prefix ?? "") + "32" + (venues[indexPath].categories.first?.icon.suffix ?? "")
        cell.setVenueCatImage(venueCatImage: venueCatImage)
    }
    
    private func createNearbyVenuesParameters(coordinate:String)->[String:Any]{
        var parameters : [String:Any] = [:]
        parameters[WebServiceParameterKeys.coordinate] = coordinate
        parameters[WebServiceParameterKeys.clientID] = AppConfig.clientIDKey
        parameters[WebServiceParameterKeys.clientSecret] = AppConfig.clientSecrectKey
        parameters[WebServiceParameterKeys.v] = AppConfig.vKey
        return parameters
    }
    
    private func createCoordinates(){
        venuesCoordinates = venues.map {(venue) -> CLLocationCoordinate2D  in
            let lat = venue.location.lat
            let lng = venue.location.lng
            return CLLocationCoordinate2D(latitude: lat, longitude: lng)
        }
    }
}
