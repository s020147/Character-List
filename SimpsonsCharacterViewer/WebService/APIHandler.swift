//
//  APIHandler.swift
//  SimpsonsCharacterViewer
//
//  Created by Jan Tong on 5/29/19.
//  Copyright © 2019 Jan Tong All rights reserved.
//

import UIKit
import Alamofire

typealias mdictionary = Dictionary<String,Any>

class ApiHandler: NSObject {
    
    static func fetchCharacterList(with completionHandler: @escaping ([CharacterObj], Error?) -> ()) {
        if let url = URL(string: ProjConfig.urlString) {
            Alamofire.request(url).responseJSON { (response) in
              
              DispatchQueue.main.async {
                if (response.error == nil){
                  if let jsonRes = response.result.value as? mdictionary {
                    completionHandler(self.parseJSON(json: jsonRes),nil)
                  }else{
                    completionHandler([],AppError.someError(message: "Error parsing the data"))
                  }
                }else{
                  completionHandler([], AppError.someError(message: "Error fetching data from the API"))
                }
              }
            }
        }else{
            completionHandler([], AppError.someError(message: "Incorrect URL"))
        }
    }
    
     static func parseJSON(json: mdictionary) -> [CharacterObj] {
        var chrArray = [CharacterObj]()
        if let topics = json["RelatedTopics"] as? [mdictionary]{
            for t in topics {
                let chrObj = CharacterObj()
                if let icon = t["Icon"] as? mdictionary{
                    if let url = icon["URL"] as? String{
                        chrObj.imgURLString = url
                    }
                }
                if let text = t["Text"] as? String{
                    let textTuple = self.getSeperatedStr(text: text)
                    chrObj.title = textTuple.0
                    if constant.defaults.object(forKey: textTuple.0) != nil{
                        chrObj.favorited = true
                    }
                    chrObj.desc = textTuple.1
                }
                chrArray.append(chrObj)
            }
        }
        return chrArray
    }
    
    private static func getSeperatedStr(text: String) -> (String, String) {
        
        var title = ""
        var desc = ""
        if let index = text.index(of: "-") {
            var i = text.index(index, offsetBy: -1)
            title = String(text[..<i])
            i = text.index(index, offsetBy: 2)
            desc = String(text[i...])
        }else{
            title = text
            desc = text
        }
        return (title, desc)
    }
    
}
