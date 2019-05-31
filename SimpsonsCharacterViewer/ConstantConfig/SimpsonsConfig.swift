//
//  SimpsonsConfig.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/29/19.
//  Copyright © 2019 Jan Tong All rights reserved.
//

import Foundation
import UIKit

struct constant{
    static let defaults = UserDefaults.standard
    static let imgPlaceholer =  UIImage(named: "placeholderImage")
    static let favoriteIcon = UIImage(named: "favorite")
    static let unfavoriteIcon = UIImage(named: "unfavorite")
    static let searchBarPlaceholder = "Search character"
    
    static let numOfCellPerRow: CGFloat = 2
    static let listViewCellHeight: CGFloat = 40
    static let gridViewCellGap: CGFloat = 10
  
  static func getfav(showSaved : Bool) -> UIImage{
    
    if showSaved {
      return constant.favoriteIcon!
    }else{
      return  constant.unfavoriteIcon!
    }
  }
}


enum AppError: Error {
    case someError(message:String)
}


struct ProjConfig{
    static let appName = "Simpsons Character Viewer"
    static let urlString = "http://api.duckduckgo.com/?q=simpsons+characters&format=json"
}
