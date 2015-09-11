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
    self.QuoteLabel.text = "Put That Pizza Down now!!! You haven't earned it yet"
  }
}
