//
//  NSDate+Ex.swift
//  FeedMe
//
//  Created by Adrian Wu on 04/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import Foundation
import UIKit


//-------------------------------------------------------------
//NSDate extensions.


extension NSDate
{
  /**
  This adds a new method dateAt to NSDate.
  
  It returns a new date at the specified hours and minutes of the receiver
  
  :param: hours: The hours value
  :param: minutes: The new minutes
  
  :returns: a new NSDate with the same year/month/day as the receiver, but with the specified hours/minutes values
  */
  func dateAt(hours hours: Int, minutes: Int) -> NSDate
  {

    let calendar = NSCalendar.currentCalendar()
    
    //get the month/day/year componentsfor today's date.
    
    print("Now = \(self)")
    
    let date_components = calendar.components([.Hour, .Minute, .Second, .Nanosecond], fromDate: NSDate())
    
    date_components.hour = hours
    date_components.minute = minutes
    date_components.second = 0
    
    let newDate = calendar.dateFromComponents(date_components)!
    return newDate
  }
}
//-------------------------------------------------------------
//Tell the system that NSDates can be compared with ==, >, >=, <, and <= operators
extension NSDate: Comparable {}

//-------------------------------------------------------------
//Define the global operators for the
//Equatable and Comparable protocols for comparing NSDates

public func ==(lhs: NSDate, rhs: NSDate) -> Bool
{
  return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool
{
  return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}
public func >(lhs: NSDate, rhs: NSDate) -> Bool
{
  return lhs.timeIntervalSince1970 > rhs.timeIntervalSince1970
}
public func <=(lhs: NSDate, rhs: NSDate) -> Bool
{
  return lhs.timeIntervalSince1970 <= rhs.timeIntervalSince1970
}
public func >=(lhs: NSDate, rhs: NSDate) -> Bool
{
  return lhs.timeIntervalSince1970 >= rhs.timeIntervalSince1970
}

let now = NSDate()
let breakfast_start_time = now.dateAt(hours:7, minutes: 0)
let breakfast_end_time = now.dateAt(hours:10, minutes: 0)
let lunch_start_time = now.dateAt(hours:11, minutes: 30)
let lunch_end_time = now.dateAt(hours: 14, minutes: 0)
let dinner_start_time = now.dateAt(hours:17, minutes: 00)
let dinner_end_time = now.dateAt(hours:20, minutes: 0)

public func whatTimeIsIt()->String {
  var mealTime = ""
  if now >= breakfast_start_time && now <= breakfast_end_time
  {
    mealTime = "BREAKFAST"
    print("Time for \(mealTime)")
  } else if now >= lunch_start_time &&  now <= lunch_end_time {
    mealTime = "LUNCH"
  } else if now >= dinner_start_time && now <= dinner_end_time{
    mealTime = "DINNER"
    }else {
    mealTime = "WAITING"
  }
  print("Time for \(mealTime)")
  return mealTime
  
}


public func todaysDateString()->String{

  let dateFormatter = NSDateFormatter()
  dateFormatter.dateFormat = "hh:mm"
  let d = NSDate()
  return dateFormatter.stringFromDate(d)
}

