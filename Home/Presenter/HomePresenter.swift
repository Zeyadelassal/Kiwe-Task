//
//  HomePresenter.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/29/21.
//

import Foundation

import Foundation

protocol HomePresenterProtocol {
    func getNearbyVenues()
    func getVenuesCount() -> Int
    func configureCell(cell:VenuesCollectionViewCellProtocol,indexPath:Int)
    func getVenueAddress(indexPath:Int)->String
}

class HomePresenter: HomePresenterProtocol{
    
    var view : HomeViewProtocol?
    var venues = [Venue]()
    
    init(view:HomeViewProtocol) {
        self.view = view
    }
    
    func getNearbyVenues(){
        let parameters = createNearbyVenuesParameters()
        Network.sharedInstance().getMethod(url: WebServiceURL.getVenues, parameters: parameters, headers: nil) { [weak self](error, response:VenueResponse?) in
            guard error == nil else{
                self?.view?.showAlert(title: "Network connection", message: "Check your connection")
                return
            }
            if let venueData = response?.response{
                self?.venues.removeAll()
                self?.venues = venueData.venues
                self?.view?.reload()
            }
        }
    }
    
    func getVenuesCount() -> Int{
        return venues.count
    }
    
    func getVenueAddress(indexPath:Int)->String{
        return venues[indexPath].location.address ?? ""
    }



    func configureCell(cell: VenuesCollectionViewCellProtocol, indexPath: Int) {
        cell.setVenueName(venueName: venues[indexPath].name)
        cell.setVenueAddress(venueAddress: venues[indexPath].location.address ?? "")
        cell.setVenueCatName(venueCatName: venues[indexPath].categories.first?.name ?? "No category available")
        let venueCatImage = (venues[indexPath].categories.first?.icon.prefix ?? "") + "64" + (venues[indexPath].categories.first?.icon.suffix ?? "")
        cell.setVenueCatImage(venueCatImage: venueCatImage)
    }
    
    private func createNearbyVenuesParameters()->[String:Any]{
        var parameters : [String:Any] = [:]
        parameters[WebServiceParameterKeys.coordinate] = "31.037933, 31.381523"
        parameters[WebServiceParameterKeys.clientID] = AppConfig.clientIDKey
        parameters[WebServiceParameterKeys.clientSecret] = AppConfig.clientSecrectKey
        parameters[WebServiceParameterKeys.v] = AppConfig.vKey
        return parameters
    }
}
