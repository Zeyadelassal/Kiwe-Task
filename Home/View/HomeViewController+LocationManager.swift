//
//  HomeViewController+LocationManager.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/31/21.
//

import Foundation
import UIKit
import CoreLocation
import GoogleMaps

extension HomeViewController:CLLocationManagerDelegate{
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {return}
        
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {return}
        print("LLLLocation",location.coordinate)
        let coordinate = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
        setCurrentLocationOnMap(coordinate: location.coordinate)
        presenter?.getNearbyVenues(coordinate: coordinate)
        reverseGeocodeCoordinate(location.coordinate)
        }
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
      
      let geocoder = GMSGeocoder()
      geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
        guard let address = response?.firstResult() else {return}
        print(address.lines)
      }
    }

}
