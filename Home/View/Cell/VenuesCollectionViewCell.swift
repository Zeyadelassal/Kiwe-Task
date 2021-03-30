//
//  VenuesCollectionViewCell.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit
import Kingfisher

protocol VenuesCollectionViewCellProtocol {
    func setVenueName(venueName:String)
    func setVenueAddress(venueAddress:String)
    func setVenueCatImage(venueCatImage:String)
    func setVenueCatName(venueCatName:String)
}

class VenuesCollectionViewCell: UICollectionViewCell , VenuesCollectionViewCellProtocol{
        
    @IBOutlet weak var addressLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var venueAddress: UILabel!
    @IBOutlet weak var venueCatName: UILabel!
    @IBOutlet weak var venueCatImage: UIImageView!
    
    func setVenueName(venueName: String) {
        self.venueName.text = venueName
    }
    
    func setVenueAddress(venueAddress: String) {
        self.venueAddress.text = venueAddress
    }
    
    func setVenueCatImage(venueCatImage: String) {
        guard let imageURL = URL(string: venueCatImage) else {
            let placeHolder = UIImage(named: "image_placeholder")
            self.venueCatImage.image = placeHolder
            return
        }
        let resource = ImageResource(downloadURL: imageURL)
        let placeHolder = UIImage(named: "image_placeholder")
        self.venueCatImage.kf.indicatorType = .activity
        self.venueCatImage.kf.setImage(with: resource, placeholder: placeHolder)
    }
    
    func setVenueCatName(venueCatName: String) {
        self.venueCatName.text = venueCatName
    }
}

