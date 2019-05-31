//
//  ItemCollectionViewExtension.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/31/19.
//  Copyright © 2019 Jan Tong. All rights reserved.
//

import Foundation
import UIKit

extension ItemCollectionViewCell{
  
  func setupCollectionViewCell(isItTrue : Bool, color : CGColor){
    itemImageView.isHidden = isItTrue
    titleLabel.isHidden = !isItTrue
    favoriteBtn.isHidden = !isItTrue
    contentView.layer.shadowColor = color
  }
}
