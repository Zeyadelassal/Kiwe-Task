//
//  HomeViewController+CollectionView.swift
//  Kiwe-Task
//
//  Created by Zeyad Ellassal on 3/30/21.
//

import Foundation
import UIKit

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func setupCollectionView(){
        venuesCollectionView.register(UINib(nibName: "VenuesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VenueCell")
        venuesCollectionView.dataSource = self
        venuesCollectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.getVenuesCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VenueCell", for: indexPath) as! VenuesCollectionViewCell
        cell.setupCell()
        if presenter?.getVenueAddress(indexPath:indexPath.item) != ""{
            cell.heightConstraint.constant = 20
            cell.fromStackToAddress.priority = UILayoutPriority(rawValue: 1000)
            cell.fromStackToName.priority = UILayoutPriority(rawValue: 999)
            
        }else{
            cell.heightConstraint.constant = 0
            cell.fromStackToAddress.priority = UILayoutPriority(rawValue: 999)
            cell.fromStackToName.priority = UILayoutPriority(rawValue: 1000)
        }
        presenter?.configureCell(cell:cell,indexPath:indexPath.item)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VenueCell", for: indexPath) as! VenuesCollectionViewCell
        if presenter?.getVenueAddress(indexPath:indexPath.item) != ""{
            let approximateWidth = view.frame.width
            let size = CGSize(width: approximateWidth, height: CGFloat.greatestFiniteMagnitude)
            cell.removeConstraint(cell.heightConstraint)
            let estimatedFrame = NSString(string: (presenter?.getVenueAddress(indexPath: indexPath.item))!).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: 18)], context: nil)
            return CGSize(width: collectionView.frame.size.width - 10, height: estimatedFrame.height + 120)
        }else{
            return CGSize(width: collectionView.frame.size.width - 10, height: 90)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
}
