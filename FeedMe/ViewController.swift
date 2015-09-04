//
//  ViewController.swift
//  FeedMe
//
//  Created by Izureru on 03/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var stepsLabel: UILabel!
  @IBOutlet weak var mealScrollView: UIScrollView!
  var timer:NSTimer?
  var mealViews:[MealView] = [MealView]()
  var selectedMeal:Meal?

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Feed Me"
    profileImageView.image = UIImage(named: "bepo")
    profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    profileImageView.clipsToBounds = true
    self.timeLabel.text = todaysDateString()

    self.stepsLabel.text = "Steps: " + String(stringInterpolationSegment: DataService.sharedInstance.currentNumberSteps())
  }
  
  override func viewDidAppear(animated: Bool) {
    if (timer == nil)
    {
      timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
      timer?.fire()
    }
    
    setupScrollView()
    jsonParsing()

  }
  
  override func viewDidDisappear(animated: Bool) {
    timer?.invalidate()
  }
  
  func updateTime()
  {
    self.timeLabel.text = todaysDateString()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func clearScrolView(){
    let subViews = self.mealScrollView.subviews
    
    for subview in subViews{
      subview.removeFromSuperview()
    }
    mealViews.removeAll(keepCapacity: false)
    mealScrollView.contentOffset = CGPointMake(0, 0)
  }

  func setupScrollView() {
    clearScrolView()

    let width = self.view.frame.width
    mealScrollView.contentSize = CGSizeMake(width * 3, 0)
    for(var i = 0; i<3;i++){
        var view = MealView(frame: CGRectMake(width * CGFloat(i), 0, width, mealScrollView.bounds.height), target: self, selectorName: "mealPageButtonAction:")
        view.button?.tag = i
        self.mealViews.append(view)
        mealScrollView.addSubview(view)
    }
  }
  
  func mealPageButtonAction(sender:AnyObject) {
    self.selectedMeal = mealViews[ (sender as! UIButton).tag].meal
    self.performSegueWithIdentifier("eatingSegue", sender: self)

  }
  
  @IBAction func eatAction(sender: AnyObject) {
   
    var page = mealScrollView.contentOffset.x / mealScrollView.frame.size.width

  }
  
  func jsonParsing()
  {
    let path: NSString = NSBundle.mainBundle().pathForResource("meals", ofType: "json")!
    var data: NSData = NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped, error: nil)!
    var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
  
    if let returnDictionary = dict.valueForKey("meals") as? [[String:String]] {
      
      for (var i = 0 ; i < returnDictionary.count ;i++ )
      {
        var mealDictionary = returnDictionary[i]
        var mealMeal = Meal()
        mealMeal.mealId = mealDictionary["mealId"]
        mealMeal.imageStr = mealDictionary["image"]
   
        if let mealNumber = mealDictionary["mealType"]?.toInt()
        {
          mealMeal.mealType = mealTypes(rawValue:mealNumber )
        }
        
        mealViews[i].meal = mealMeal
        mealViews[i].imageView?.image = UIImage(named: mealMeal.imageStr!)
        
      }
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    switch segue.identifier!{
    case "eatingSegue":
        println("eating segueeeeee")
        var mealTBV = segue.destinationViewController as! MealTableViewController
        mealTBV.meal = selectedMeal

    default:
      println("HAHAHAHAHAH")
    }
  }

}

