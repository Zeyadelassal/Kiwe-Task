//
//  HomeViewController.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import UIKit
import CoreLocation
import GoogleMaps
import JJFloatingActionButton

protocol HomeViewProtocol : Alertable{
    func reload()
}

class HomeViewController: UIViewController, HomeViewProtocol{
    
    @IBOutlet weak var googleMapView: GMSMapView!
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var venuesCollectionView: UICollectionView!
    @IBOutlet weak var venuesCollectionViewLayout: UICollectionViewFlowLayout!
    
    var presenter : HomePresenterProtocol?
    let locationManager = CLLocationManager()
    let actionButton = JJFloatingActionButton()
    var selectedTab = HomeTabs.home
    var userMail : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.alpha = 0.5
        presenter = HomePresenter(view:self)
        setupLocationManager()
        setupCollectionView()
        setupFloatingButton()
        setupGoogleMapView()
        showActivityIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor(rgb: 0xF9F9F9)
        venuesCollectionView.backgroundColor = UIColor(rgb: 0xF9F9F9)
        view.bringSubviewToFront(sideMenuView)
        setupNavigationBar()
        sideMenuView.isHidden = true
    }
    
    func reload() {
        UIView.animate(withDuration:2) {
            self.view.alpha = 1
        }
        stopActivityIndicator()
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
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.hidesBackButton = false
    }
    
    @IBAction func logout(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func gotoProfile(_ sender: Any) {
        let profileVC = ProfileViewController()
        profileVC.userMail = self.userMail
        self.navigationController?.pushViewController(profileVC, animated: true)
        sideMenuTrailingConstraint?.constant = 0
    }
    
    @IBAction func gotoTerms(_ sender: Any) {
        self.navigationController?.pushViewController(TermsAndConditionsViewController(), animated: true)
        sideMenuTrailingConstraint?.constant = 0
    }
}
