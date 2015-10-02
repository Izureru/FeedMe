//
//  RestApiManager.swift
//  FeedMe
//
//  Created by Izureru on 02/10/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
  static let sharedInstance = RestApiManager()
  
//  let baseURL = "http://api.theysaidso.com/qod.json"
  let baseURL = "http://quotesondesign.com/api/3.0/api-3.0.json"
  
  func getRandomUser(onCompletion: (JSON) -> Void) {
    let route = baseURL
    makeHTTPGetRequest(route, onCompletion: { json, err in
      onCompletion(json as JSON)
    })
  }
  
  func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
    let request = NSMutableURLRequest(URL: NSURL(string: path)!)
    request.HTTPMethod = "GET"
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
      let json:JSON = JSON(data: data)
      onCompletion(json, error)

    }
  }
}
