//
//  CustomTextField.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

@IBDesignable class customUITextField: UITextField {
    
    //To apply corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0){
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        if let image = leftImage {
            let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 35, height: 25))
            let iconView = UIImageView(frame: CGRect(x: 15, y: 5, width: 15, height: 15)) // set your Own size
            //            iconView.backgroundColor = .green
            iconView.image = image
            
            //            iconContainerView.backgroundColor = .red
            iconContainerView.addSubview(iconView)
            leftView = iconContainerView
            leftViewMode = .always
            self.tintColor = .lightGray
            leftViewMode = UITextField.ViewMode.always
            //            let imageView = UIImageView(frame: CGRect(x: -5.0, y: 0, width: 20, height: 20))
            //               imageView.contentMode = .scaleAspectFit
            //               imageView.image = image
            //               // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            //               imageView.tintColor = imageColor
            //               leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        //           // Placeholder text color
        //           attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: ])
    }
    
    func setup() {
        //Basic texfield Setup
        self.backgroundColor = UIColor.white // Use anycolor that give you a 2d look.
        
        
        //        self.layer.cornerRadius = self.frame.size.height / 2
        
        //To apply border
        //        self.borderStyle = .none
        self.layer.borderWidth = 0.1
        self.layer.borderColor = UIColor.white.cgColor
        
        //To apply Shadow
        //        self.layer.shadowOpacity = 1
        //        self.layer.shadowRadius = 3.0
        //        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        
        //To apply padding
        //        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height:  self.frame.height))
        
        //        self.leftViewMode = .always
        //        self.leftViewMode = UITextField.ViewMode.always
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
