//
//  UIView+Nib.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/31/21.
//

import Foundation
import UIKit

extension UIView{
    class func viewFromNibName(_ name: String) -> UIView? {
        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return views?.first as? UIView
    }
}

