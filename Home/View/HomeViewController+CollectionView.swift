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
        let layout = venuesCollectionView.collectionViewLayout
           if let flowLayout = layout as? UICollectionViewFlowLayout {
               flowLayout.estimatedItemSize = CGSize(
                width: view.frame.width - 20 ,
                   // Make the height a reasonable estimate to
                   // ensure the scroll bar remains smooth
                   height: 200
               )
           }
//        venuesCollectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VenueCell", for: indexPath) as! VenuesCollectionViewCell
        cell.venueName.text = "Test"
        presenter?.configureCell(cell:cell,indexPath:indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 275)
    }
}
