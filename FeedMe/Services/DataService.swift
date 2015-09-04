//
//  DataService.swift
//  FeedMe
//
//  Created by Adrian Wu on 04/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit

class DataService: NSObject {
  static let sharedInstance = DataService()

  func getMeals(steps:Int) -> [Meal]{
    var meals = [Meal]()
    return meals
  }
  
  func parseJson(JsonData:NSData) ->[Meal]{
    var meals = [Meal]()
    return meals
  }
  
  func checkTime(){
    //
    //    let now = NSDate()
    //    let eight_today = now.dateAt(hours: 8, minutes: 0)
    //    let four_thirty_today = now.dateAt(hours:16, minutes: 30)
    //
    //    if now >= eight_today &&
    //      now <= four_thirty_today
    //    {
    //      println("The time is between 8:00 and 16:30")
    //    }
  }
  
  func currentNumberSteps()->Int{
    return 1000
  }
 
}
