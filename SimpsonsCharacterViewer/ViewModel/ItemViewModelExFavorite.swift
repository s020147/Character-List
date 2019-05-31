//
//  ItemViewModelExFavorite.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/31/19.
//  Copyright © 2019 Jan Tong. All rights reserved.
//

import Foundation
import UIKit

extension ItemViewModel{

func favoriteAt(index: Int) -> Bool {
  return filteredCharacterList[index].favorited
}

func getFilteredFavoriteCharacters(text: String) {
  if text.isEmpty{
    filteredCharacterList = favoriteCharacterList
  }else{
    filteredCharacterList = favoriteCharacterList.filter({
      ($0.title?.uppercased().contains(text.uppercased()))!
    })
  }
}

func populateFavoriteList(){
  favoriteCharacterList = characterList.filter({
    $0.favorited
  })
}

func favoriteItemAt(character: CharacterObj){
  for chr in characterList {
    if chr.title == character.title{
      chr.favorited = character.favorited
      break
    }
  }
}
}
