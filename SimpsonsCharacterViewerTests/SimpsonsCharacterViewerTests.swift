//
//  SimpsonsCharacterViewerTests.swift
//  SimpsonsCharacterViewerTests
//
//  Created by Jan Tong on 5/29/19..
//  Copyright © 2019 Jan Tong. All rights reserved.
//

import XCTest
import Alamofire
@testable import SimpsonsCharacterViewer

class SimpsonsCharacterViewerTests: XCTestCase {

  var vc : MainViewController?
  var detailVC : DetailViewController?
  
    override func setUp() {
      super.setUp()
      vc = MainViewController()
      detailVC = DetailViewController()
    }

    override func tearDown() {
      super.tearDown()
       vc = nil
      detailVC = nil
    }
  
  func testViewModelInit(){
    vc?.setUpViewModel()
    XCTAssertNotNil(vc?.vm, "can not init view model")
  }
  
  
  func testFavorite(){
    let newMockObj = CharacterObj()
    newMockObj.title = "testing"
    newMockObj.favorited = true
    detailVC?.setFavoriteModel(character: newMockObj)
    let obj = constant.defaults.value(forKey: newMockObj.title!)
    let newObj = obj as! Bool
    if(newObj){
      XCTAssertTrue(newObj)
    }
  }
  
  func testRemove(){
    let newMockObj = CharacterObj()
    newMockObj.title = "testing"
    newMockObj.favorited = true
    detailVC?.setFavoriteModel(character: newMockObj)
    let obj = constant.defaults.value(forKey: newMockObj.title!)
    let newObj = obj as! Bool
    if(newObj == true){
      detailVC?.setUnfavoriteModel(character: newMockObj)
      let superNewObj = constant.defaults.value(forKey: newMockObj.title!)
      XCTAssertNil(superNewObj)
    }
  }

    
    func testWebServiseCall(){
        
        let expect = expectation(description: "Check Web service call response from server")
      
      ApiHandler.fetchCharacterList { (array, error) in
        XCTAssertNil(error, "Unexpected error occured: \(String(describing: error?.localizedDescription))")
        XCTAssertNotNil(array, "No result")
        expect.fulfill()

      }
      
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Test time out: \(String(describing: error?.localizedDescription))")
        }
    }
    
    func testObject(){
        let expect = expectation(description: "Check the value of the first item")
      
      ApiHandler.fetchCharacterList { (array, error) in
        XCTAssertEqual((array[0].title)!, "Apu Nahasapeemapetilon")
        expect.fulfill()

      }
      
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Test time out: \(String(describing: error?.localizedDescription))")
        }
    }
}

