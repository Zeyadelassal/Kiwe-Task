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
        actionButton.buttonImage = UIImage(named: "pin")
        actionButton.buttonColor = UIColor(rgb: 0x374286)
        actionButton.buttonImageColor = .white
        }
    }

