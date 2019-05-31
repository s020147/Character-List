//
//  MasterViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/29/19.
//  Copyright © 2019 Jan Tong All rights reserved.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    @IBOutlet weak var segmentBtn: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var favoriteBtn: UIBarButtonItem!
    
    lazy var isListView = true
    lazy var showSaved = false
  var vm : ItemViewModel!
  
  func setUpViewModel(){
    vm = ItemViewModel()
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModel()
        configuration()
    }
    
    func configuration() {
        
        title = ProjConfig.appName
        searchBar.placeholder = constant.searchBarPlaceholder
        vm.getItems { (error) in
            if error == nil {
                    self.itemCollectionView.reloadData()
            }
        }
    }
  
  func reloadOnMainQueue(){
    DispatchQueue.main.async {
      self.itemCollectionView.reloadData()
    }
  }
  
    @IBAction func favoriteBtnClicked(_ sender: Any) {
        
        showSaved = !showSaved
      favoriteBtn.image = constant.getfav(showSaved: showSaved)
      reloadOnMainQueue()
    }
    
    @IBAction func segmentBtnClicked(_ sender: Any) {
        switch segmentBtn.selectedSegmentIndex {
        case 0:
            isListView = true
        case 1:
            isListView = false
        default:
            break
        }
      reloadOnMainQueue()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        reloadOnMainQueue()
    }
}


