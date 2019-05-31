//
//  MainViewControllerCollectionView.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/30/19.
//  Copyright © 2019 Jan Tong. All rights reserved.
//

import Foundation
import UIKit
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if showSaved {
            vm.populateFavoriteList()
            vm.getFilteredFavoriteCharacters(text: searchBar.text!)
        }else{
            vm.getFilteredCharacters(text: searchBar.text!)
        }
        return vm.getFilteredCharacterListCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCollectionViewCell
        if isListView {
            cell.setupCollectionViewCell(isItTrue: true,color : UIColor.clear.cgColor)
            cell.titleLabel.text = vm.getTitleAt(index: indexPath.row)
            cell.favoriteBtn.isSelected = vm.favoriteAt(index: indexPath.row)
        } else {
            cell.contentView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.setupCollectionViewCell(isItTrue: false,color: UIColor.black.cgColor )
            cell.itemImageView.sd_setImage(with: URL(string: vm.getImgURLStringAt(index: indexPath.row)!), placeholderImage: constant.imgPlaceholer, options: .refreshCached, completed: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.model = vm.getCharacterAt(index: indexPath.row)
        controller.delegate = self as! CanFavorite
        splitViewController?.showDetailViewController(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bound = splitViewController?.primaryColumnWidth
        if isListView {
            return CGSize(width: bound!, height: constant.listViewCellHeight)
        }else{
            let width:CGFloat = (bound! - constant.gridViewCellGap)/constant.numOfCellPerRow
            return CGSize(width: width, height: width)
        }
    }
    
}
