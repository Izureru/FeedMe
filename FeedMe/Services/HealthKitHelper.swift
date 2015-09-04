//
//  HealthKitHelper.swift
//  FeedMe
//
//  Created by Izureru on 04/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit
import HealthKit


let calendar = NSCalendar.currentCalendar()

class HealthKit {
   let storage = HKHealthStore()
   let yesterday = calendar.dateByAddingUnit(.CalendarUnitDay, value: -1, toDate: NSDate(), options: nil)
  
    init()
    {
      checkAuthorization()
    }
  
  func checkAuthorization() -> Bool {
    var isEnabled = true
    
    if HKHealthStore.isHealthDataAvailable()
    {
      let steps = NSSet(object: HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount))
      
      storage.requestAuthorizationToShareTypes(nil, readTypes: steps as Set<NSObject>) {(success, error) -> Void in
        isEnabled = success
      }
    }else{
     isEnabled = false
    }
    return isEnabled
  }
  
  func recentSteps(completion: (Double, NSError?) -> () ) {
    let type = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
    
    let predicate = HKQuery.predicateForSamplesWithStartDate(yesterday, endDate: NSDate(), options: .None)
    
    let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: 0, sortDescriptors: nil) { query, results, error in
      var steps:Double = 0
      
      if results?.count > 0 {
        
        for result in results as! [HKQuantitySample] {
          steps += result.quantity.doubleValueForUnit(HKUnit.countUnit())
        }
      }
      completion(steps, error)
    }
    
    storage.executeQuery(query)
  }
}
