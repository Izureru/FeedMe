//
//  Meal.swift
//  FeedMe
//
//  Created by Izureru on 04/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit
enum mealTypes:Int {
  case Breakfast = 1
  case Lunch
  case Dinner
}

class Meal: NSObject {
  

  var imageStr:String?
  var mealId:String?
  var mealType:mealTypes?
}
