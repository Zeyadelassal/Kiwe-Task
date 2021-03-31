//
//  HomeViewController+FloatingButton.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/31/21.
//

import Foundation
import JJFloatingActionButton

extension HomeViewController{
    
    func setupFloatingButton(){
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        actionButton.buttonColor = UIColor(rgb: 0x374286)
        actionButton.buttonImage = UIImage(named: "pin")
        actionButton.buttonImageColor = .white
        addItemToFloatingButton()
    }
    
    func addItemToFloatingButton(){
        actionButton.addItem(title: "map", image: UIImage(named: "pin")?.withRenderingMode(.alwaysTemplate)) { [weak self] item in
            switch(self?.selectedTab){
            case .home:
                self?.googleMapView.isHidden = false
                self?.venuesCollectionView.isHidden = true
                self?.selectedTab = .map
                self?.actionButton.imageView.image = UIImage(named: "list")
                self?.drawMarks()
                break
            case .map:
                self?.googleMapView.isHidden = true
                self?.venuesCollectionView.isHidden = false
                self?.selectedTab = .home
                self?.actionButton.imageView.image = UIImage(named: "pin")
                break
            default:
                print("default")
            }

        }
    }
}

