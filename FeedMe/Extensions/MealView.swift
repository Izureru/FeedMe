//
//  MealView.swift
//  FeedMe
//
//  Created by Izureru on 04/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit

class MealView: UIView {
  var imageView:UIImageView?
  var button:UIButton?
  var meal:Meal?
  
  init(frame: CGRect , target:AnyObject, selectorName:Selector) {
    super.init(frame: frame)
    imageView = UIImageView(frame: CGRectMake(0, 0, frame.width, frame.height))
    button = UIButton(frame: CGRectMake(0, 0, frame.width, frame.height))
    button?.addTarget(target, action: selectorName, forControlEvents: UIControlEvents.TouchUpInside)
    addSubview(imageView!)
    addSubview(button!)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
