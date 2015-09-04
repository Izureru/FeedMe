//
//  Meal.swift
//  FeedMe
//
//  Created by Izureru on 04/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit

class Meal: NSObject {
  
  enum mealTypes:Int {
    case Breakfast = 1
    case Lunch
    case Dinner
  }

  var name:String?
  var info:String?
  var imageStr:String?
  var mealType:mealTypes?
  
}
