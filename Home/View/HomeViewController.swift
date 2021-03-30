//
//  HomeViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = createSideMenuButton()
    }
    
    private func createSideMenuButton() -> UIBarButtonItem{
        let sideMenuButtonImage = UIImage(named: "menu")
        return UIBarButtonItem(image: sideMenuButtonImage, style: .plain, target: self, action: #selector(sideMenuPressed))
    }
    
    @objc private func sideMenuPressed(){
        UIView.animate(withDuration: 1) {[weak self] in
            if self?.sideMenuTrailingConstraint.constant == 0 {
                self?.sideMenuTrailingConstraint?.constant = (self?.view.frame.width)! / 2
            }else{
                self?.sideMenuTrailingConstraint?.constant = 0
            }
            self?.view.layoutIfNeeded()
        }
    }
}
