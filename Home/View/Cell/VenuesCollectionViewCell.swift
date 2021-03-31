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
    //    func getHeight()->Bool
}

class VenuesCollectionViewCell: UICollectionViewCell , VenuesCollectionViewCellProtocol{
    
    
    @IBOutlet weak var fromStackToAddress: NSLayoutConstraint!
    
    @IBOutlet weak var fromStackToName: NSLayoutConstraint!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var venueAddress: UILabel!
    @IBOutlet weak var venueCatName: UILabel!
    @IBOutlet weak var venueCatImage: UIImageView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    func setVenueName(venueName: String) {
        self.venueName.text = venueName
    }
    override func layoutSubviews() {
        
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
        //        let placeHolder = UIImage(named: "image_placeholder")
        //        self.venueCatImage.image = placeHolder
    }
    
    func setVenueCatName(venueCatName: String) {
        self.venueCatName.text = venueCatName
    }
    
    func setupCell(){
        layer.cornerRadius = 10
        layer.masksToBounds = true
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 2.0, height: 3.0)
//        layer.shadowRadius = 4.0
//        layer.shadowOpacity = 0.5
        layer.borderWidth = 1
        layer.borderColor = UIColor(rgb: 0x1d3557).cgColor
        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    
}
