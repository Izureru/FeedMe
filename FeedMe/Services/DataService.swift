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
    //    }.
  }
  
  func mealsForType(mealType:mealTypes, data:[Meal]) -> [Meal]{
    var output = [Meal]()
    
    for meal in data{
      if meal.mealType == mealType{
        output.append(meal)
      }
    }
    return output
  }
  
  func currentNumberSteps()->Int{
    
    var steps = Int(arc4random_uniform(10000))
    return steps
  }
  
  func parseData(dict:[[String:String]]) ->[Meal]{
    var output = [Meal]()
    
      for (var i = 0 ; i < dict.count ;i++ )
      {
        var mealDictionary = dict[i]
        var mealMeal = Meal()
        mealMeal.mealId = mealDictionary["mealId"]
        mealMeal.imageStr = mealDictionary["image"]
        
        if let mealNumber = mealDictionary["mealType"]?.toInt()
        {
          mealMeal.mealType = mealTypes(rawValue:mealNumber )
        }
        output.append(mealMeal)
      }
    return output
  
  }
}
