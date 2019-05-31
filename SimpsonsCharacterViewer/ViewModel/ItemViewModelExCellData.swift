//
//  ItemViewModelExCellData.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/31/19.
//  Copyright © 2019 Jan Tong. All rights reserved.
//

import Foundation

extension ItemViewModel{
  func getCharacterAt(index: Int) -> CharacterObj {
    return filteredCharacterList[index]
  }
  
  func getImgURLStringAt(index: Int) -> String? {
    return filteredCharacterList[index].imgURLString
  }
  
  func getTitleAt(index: Int) -> String? {
    return filteredCharacterList[index].title
  }  
}
