//
//  AppDelegate.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/29/19.
//  Copyright © 2019 Jan Tong All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        rootSetUp()
        return true
    }
}

