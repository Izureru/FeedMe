//
//  CheckTime.swift
//  FeedMe
//
//  Created by Izureru on 11/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit

class CheckTime: NSObject {
  var todaysDate:NSDate = NSDate()
  var dateFormatter:NSDateFormatter = NSDateFormatter()
  
  func getTime(){
    dateFormatter.dateFormat = "HH:mm"
    var dateInFormat:String = dateFormatter.stringFromDate(todaysDate)
    println(dateInFormat)
  }
}

