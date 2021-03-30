//
//  CustomImageView.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

@IBDesignable class CustomImageView: UIImageView {
    
    @IBInspectable var rounded : Bool = false{
        didSet{
            if (rounded){
                self.layer.borderWidth = 0.5
                self.layer.masksToBounds = false
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.cornerRadius = self.frame.height / 2
                self.clipsToBounds = true
            }else{
                self.layer.borderWidth = 0
                self.layer.cornerRadius = 0
                self.layer.borderColor = UIColor.clear.cgColor
            }

        }
    }
}
