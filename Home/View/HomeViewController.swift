//
//  HomeViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit

protocol HomeViewProtocol : Alertable{
    
}

class HomeViewController: UIViewController, HomeViewProtocol{
    
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var venuesCollectionView: UICollectionView!
    @IBOutlet weak var venuesCollectionViewLayout: UICollectionViewFlowLayout!
    
    var presenter : HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getNearbyVenues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter = HomePresenter(view:self)
        setupNavigationBar()
        setupCollectionView()
        sideMenuView.isHidden = true
    }
    
    private func setupNavigationBar(){
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = createSideMenuButton()
    }
    
    private func createSideMenuButton() -> UIBarButtonItem{
        let sideMenuButtonImage = UIImage(named: "menu")
        return UIBarButtonItem(image: sideMenuButtonImage, style: .plain, target: self, action: #selector(sideMenuPressed))
    }
    
    @objc private func sideMenuPressed(){
        UIView.animate(withDuration: 1) {
            [weak self] in
            if self?.sideMenuTrailingConstraint.constant == 0 {
                self?.sideMenuView.isHidden = false
                self?.sideMenuTrailingConstraint?.constant = (self?.view.frame.width)! / 2
            }else{
                self?.sideMenuTrailingConstraint?.constant = 0
            }
            self?.view.layoutIfNeeded()
        } completion: { [weak self] (finished) in
            if self?.sideMenuTrailingConstraint.constant != 0 {
                self?.sideMenuView.isHidden = false
            }
        }
    }
}
