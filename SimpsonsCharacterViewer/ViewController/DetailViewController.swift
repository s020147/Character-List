//
//  DetailViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/29/19.
//  Copyright © 2019 Jan Tong All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var model: CharacterObj?
    var delegate: CanFavorite?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = model?.title
        
        if let imgUrlStr = model?.imgURLString{
            itemImageView.sd_setImage(with: URL(string: imgUrlStr), placeholderImage: constant.imgPlaceholer, options: .refreshCached, completed: nil)
          itemImageView.layer.cornerRadius = itemImageView.frame.size.width/2
          itemImageView.layer.borderWidth = 1
          itemImageView.layer.masksToBounds = false
          itemImageView.layer.borderColor = UIColor.black.cgColor
          itemImageView.clipsToBounds = true
        }
        if let title = model?.title {
            titleLbl.text = title
            likeButton.isSelected = (model?.favorited)! ? true : false
            likeButton.isHidden = false
        }
        if let desc = model?.desc {
            descLbl.text = desc
        }
    }
  
  
  
    
  func setFavoriteModel(character: CharacterObj){
    constant.defaults.set(true, forKey: (character.title)!)
  }
  func setUnfavoriteModel(character: CharacterObj){
    constant.defaults.removeObject(forKey: (character.title)!)
  }
  
  @IBAction func favoriteBtnClicked(_ sender: Any) {
    likeButton.isSelected = !likeButton.isSelected
    model?.favorited = !(model?.favorited)!
    if (model?.favorited)! {
      setFavoriteModel(character: model!)
    } else {
      setUnfavoriteModel(character: model!)
    }
    delegate?.saveItemAt(model: model!)
  }
  
}
    

protocol CanFavorite {
    func saveItemAt(model: CharacterObj)
}


