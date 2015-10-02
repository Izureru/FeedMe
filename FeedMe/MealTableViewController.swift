//
//  MealTableViewController.swift
//  FeedMe
//
//  Created by Izureru on 04/09/2015.
//  Copyright (c) 2015 Marks and Spencer. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

  var footerView:UIView?
  var totalLabel:UILabel?
  var meal:Meal?
  var mealItems:[MealItem]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      // change me when you can
        title = "Meal"
        if let mealid = meal?.mealId{
          mealItems = mealItemsForId(jsonParsing(), mealId:mealid)
        }
      tableView.separatorInset = UIEdgeInsetsZero
      
      tableView.reloadData()
    }
  
    override func viewWillAppear(animated: Bool) {
      println(meal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

  
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      return 200
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
      if let count = mealItems?.count{
        return count
      }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mealItemCell", forIndexPath: indexPath) as! MealItemTableViewCell
      cell.layoutMargins = UIEdgeInsetsZero;
      cell.preservesSuperviewLayoutMargins = false;
      var item = self.mealItems![indexPath.row]
      
          cell.MealItemImageView?.image = UIImage(named: item.imageStr!)
          cell.TitleLabel.text = item.name
          cell.infoTextView.text = item.info
        return cell
    }
  
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
      return 50
    }
  
  
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
      if(footerView == nil)
      {
        footerView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, 50))
        footerView!.backgroundColor = UIColor(red: (77/255), green: (150/255), blue: (122/255), alpha: 1.0)
        

        totalLabel = UILabel(frame: CGRectMake(0, 0, self.view.frame.width, 50))
        totalLabel?.text = "£0.00"
        totalLabel?.textAlignment = NSTextAlignment.Center
        totalLabel?.backgroundColor = UIColor.clearColor()
        totalLabel?.font = UIFont.boldSystemFontOfSize(15)
        totalLabel?.textColor = UIColor.whiteColor()
        footerView!.addSubview(totalLabel!)
      }
      
      return footerView
    }

  
    func updatePriceLabel(price: Int){
        totalLabel?.text = NSString(format: "£%.2d", price) as String
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
  
  func jsonParsing() -> [MealItem]
  {
    var array:[MealItem] = [MealItem]()
    let path: NSString = NSBundle.mainBundle().pathForResource("mealItems", ofType: "json")!
    var data: NSData = NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped, error: nil)!
    var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
    
    if let returnDictionary = dict.valueForKey("mealItems") as? [[String:String]] {
      
      for (var i = 0 ; i < returnDictionary.count ;i++ )
      {
        var mealDictionary = returnDictionary[i]
        var mealMeal = MealItem()
        
        // TODO: ensure all json array name match the mealItem object attributes
        
        mealMeal.mealId = mealDictionary["mealId"]
        mealMeal.name = mealDictionary["title"]
        mealMeal.info = mealDictionary["info"]
        mealMeal.imageStr = mealDictionary["image"]
        
        array.append(mealMeal)
      }
      
    }
    return array
  }
  
  func mealItemsForId(items:[MealItem], mealId:String)->[MealItem]{
    var array:[MealItem] = [MealItem]()
    for meal in items{
      if let currentId = meal.mealId{
        if currentId == mealId{
          array.append(meal)
        }
      }
    }
    return array
  }

}
