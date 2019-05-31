//
//  AppdelegateExSplit.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/31/19.
//

import Foundation
import UIKit

extension AppDelegate{
  
  func rootSetUp(){
    let splitViewController = window!.rootViewController as! UISplitViewController
    let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
    navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
    splitViewController.delegate = self
  }
  
  func setUpSplitViewController(){
    
    guard let splitViewController = window?.rootViewController as? UISplitViewController else {return}
    splitViewController.delegate = self
    splitViewController.preferredDisplayMode = .allVisible
    
  }
  
  func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
    
    return true
  }
  
}
