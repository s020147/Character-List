//
//  MainViewControllerSearchBar.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/30/19.
//  Copyright © 2019 Jan Tong. All rights reserved.
//
import UIKit
import Foundation
extension MainViewController: UISearchBarDelegate, CanFavorite {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        itemCollectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func saveItemAt(model: CharacterObj) {
        vm.favoriteItemAt(character: model)
        itemCollectionView.reloadData()
    }
}
