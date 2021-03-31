//
//  HomeViewController+GoogleMaps.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/31/21.
//

import Foundation
import UIKit
import GoogleMaps
import CoreLocation
import Kingfisher

extension HomeViewController: GMSMapViewDelegate{
    
    func setupGoogleMapView(){
        googleMapView.delegate = self
        googleMapView.isMyLocationEnabled = true
    }
    
    func setCurrentLocationOnMap(coordinate: CLLocationCoordinate2D){
        googleMapView.camera = GMSCameraPosition(target: coordinate, zoom: 17, bearing: 0, viewingAngle: 0)
    }
    
    func drawMarks(){
        let marksCount = presenter?.getVenuesCount() ?? 0
        for index in 0..<marksCount{
            let coordinate = (presenter?.getVenueCoordinate(index:index))!
            let marker = GMSMarker(position: coordinate)
            marker.icon = UIImage(named:"default_marker")
            marker.groundAnchor = CGPoint(x: 0.5, y: 1)
            marker.appearAnimation = .pop
            marker.title = String(index)
            marker.map = googleMapView
        }
    }
    
    func mapView(_ mapView: GMSMapView,markerInfoContents marker: GMSMarker) -> UIView? {
        guard let infoView = UIView.viewFromNibName("MarkerInfoView") as? MarkerInfoView
           else {
             return nil
         }
        guard let index = Int(marker.title!) else {return nil}
        let venue = presenter?.getVenue(at:index)
        infoView.venueName.text = venue?.name
        infoView.venueAddress.text = venue?.location.address
        infoView.venueCatName.text = venue?.categories.first?.name
        let venueCatImage = (venue?.categories.first?.icon.prefix ?? "") + "64" + (venue?.categories.first?.icon.suffix ?? "")
        
        guard let imageURL = URL(string: venueCatImage) else {
            let placeHolder = UIImage(named: "image_placeholder")
            infoView.venueCatImage.image = placeHolder
            return infoView
        }
        
        let resource = ImageResource(downloadURL: imageURL)
        let placeHolder = UIImage(named: "image_placeholder")
        infoView.venueCatImage.kf.indicatorType = .activity
        infoView.venueCatImage.kf.setImage(with: resource, placeholder: placeHolder)
        return infoView
    }
}
