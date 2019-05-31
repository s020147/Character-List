//
//  ItemViewModelExFilters.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/31/19.
//  Copyright © 2019 Jan Tong. All rights reserved.
//

import Foundation
import UIKit


extension ItemViewModel{
  
  func getFilteredCharacterListCount() -> Int {
    return filteredCharacterList.count
  }
  
  func getFilteredCharacters(text: String) {
    if text.isEmpty{
      filteredCharacterList = characterList
    }else{
      filteredCharacterList = characterList.filter({
        ($0.title?.uppercased().contains(text.uppercased()))!
      })
    }
  }
}
