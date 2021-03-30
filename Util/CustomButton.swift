//
//  CustomButton.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

@IBDesignable class customUIButton: UIButton {
    
    //To apply corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
       didSet {
           layer.cornerRadius = cornerRadius
       }
    }
//    @IBInspectable var shadowRadius: CGFloat = 0 {
//       didSet {
//        self.layer.shadowRadius = shadowRadius
//       }
//    }
//    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0){
//        didSet{
//            self.layer.shadowOffset = shadowOffset
//
//        }
//    }
     func setup() {
        
        //To apply border
        self.layer.borderWidth = 0.25
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
 }

 override init(frame: CGRect) {
     super.init(frame: frame)
     setup()
 }
 required public init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
     setup()
 }
}
