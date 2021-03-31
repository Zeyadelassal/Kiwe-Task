//
//  HomeViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit
import CoreLocation
import JJFloatingActionButton

protocol HomeViewProtocol : Alertable{
    func reload()
}

class HomeViewController: UIViewController, HomeViewProtocol{
    
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var venuesCollectionView: UICollectionView!
    @IBOutlet weak var venuesCollectionViewLayout: UICollectionViewFlowLayout!
    
    var presenter : HomePresenterProtocol?
    let locationManager = CLLocationManager()
    let actionButton = JJFloatingActionButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.bringSubviewToFront(sideMenuView)
        presenter = HomePresenter(view:self)
        presenter?.getNearbyVenues()
        setupNavigationBar()
        setupCollectionView()
        setupFloatingButton()
        sideMenuView.isHidden = true
    }
    
    func reload() {
        venuesCollectionView.reloadData()
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
