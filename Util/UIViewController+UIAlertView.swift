//
//  UIViewController+UIAlertView.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import Foundation
import UIKit

protocol Alertable {
    func showAlert(title:String,message:String)
}

fileprivate var indicatorView:UIView?

extension UIViewController{
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { (okAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension UIViewController{
    func showActivityIndicator() {
        indicatorView = UIView(frame: self.view.bounds)
        indicatorView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.center = (indicatorView?.center)!
        indicator.color = UIColor(rgb: 0x374286)
        //UIColor(rgb: 0x1d3557)
        indicator.startAnimating()
        indicatorView?.addSubview(indicator)
        self.view.addSubview(indicatorView!)
    }
    
    func stopActivityIndicator(){
        indicatorView?.removeFromSuperview()
        indicatorView = nil
    }
}
