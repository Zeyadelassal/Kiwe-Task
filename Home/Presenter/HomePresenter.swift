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
    func configureCell(cell:VenuesCollectionViewCellProtocol,indexPath:Int)
}

class HomePresenter: HomePresenterProtocol{
    
    var view : HomeViewProtocol?
    
    init(view:HomeViewProtocol) {
        self.view = view
    }
    
    func getNearbyVenues(){
        let parameters = createNearbyVenuesParameters()
        Network.sharedInstance().getMethod(url: WebServiceURL.getVenues, parameters: parameters, headers: nil) { (error, response:VenueResponse?) in
            
        }
    }

    func configureCell(cell: VenuesCollectionViewCellProtocol, indexPath: Int) {
        
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
