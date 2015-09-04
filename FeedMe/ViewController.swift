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
  
  @IBAction func eatAction(sender: AnyObject) {
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupScrollView()
    profileImageView.image = UIImage(named: "bepo")
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func setupScrollView() {
    let width = self.view.frame.width
    mealScrollView.contentSize = CGSizeMake(width * 3, 0)
    for(var i = 0; i<3;i++){

        var view = UIView(frame: CGRectMake(width * CGFloat(i), 0, width, mealScrollView.frame.height))
        var button = UIButton(frame: CGRectMake(0, 0, width, mealScrollView.frame.height))
        button.setTitle("BUTTON", forState: UIControlState.Normal )
        button.addTarget(self, action: "mealPageButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        if (i%2 == 0){
          view.backgroundColor = UIColor.redColor()
        }
        else{
          view.backgroundColor = UIColor.yellowColor()
        }
        mealScrollView.addSubview(view)
      
    }
  }

  
  func mealPageButtonAction() {
      self.performSegueWithIdentifier("eatingSegue", sender: self)
  }
  
}

