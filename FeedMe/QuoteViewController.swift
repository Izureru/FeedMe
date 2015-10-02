//
//  QuoteViewController.swift
//  FeedMe
//
//  Created by Izureru on 11/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

  @IBOutlet weak var QuoteLabel: UILabel!

  override func viewDidLoad() {
    
    self.QuoteLabel.text = ""
    addDummyData()

   }
  override func viewDidAppear(animated: Bool) {
  }
  func addDummyData() {
    RestApiManager.sharedInstance.getRandomUser { json in
      let quote = json["quote"]
      self.QuoteLabel.text = quote.rawString()
    }
  }
}


//func addDummyData() {
//  RestApiManager.sharedInstance.getRandomUser { json in
//    let contents = json["contents"]
//    //      for (index: String, subJson: JSON) in contents {
//    let quotes = contents["quotes"]
//    let quote = quotes.arrayValue
//    var statement = quote[0]["quote"]
//    println(statement)
//  }
//}
//}