
//
//  ItemViewModel.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/29/19.
//  Copyright © 2019 Jan Tong All rights reserved.
//

import UIKit

typealias Completion = (Error?) -> ()

class ItemViewModel: NSObject {
     lazy var characterList = [CharacterObj]()
     lazy var favoriteCharacterList = [CharacterObj]()
     lazy var filteredCharacterList = [CharacterObj]()
    
    func getItems (complete: @escaping Completion){
        ApiHandler.fetchCharacterList { (array, error) in
            if (error == nil){
                self.characterList = array
                self.filteredCharacterList = array
                complete(nil)
            }else{
                complete(error)
            }
        }
    }
}
