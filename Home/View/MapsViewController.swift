//
//  MapsViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/31/21.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {

    @IBOutlet weak var googleMap: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleMap.isMyLocationEnabled = true
        googleMap.settings.myLocationButton = true
    }

}
