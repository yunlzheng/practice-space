//
//  DetailsViewController.swift
//  FoodPin
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 yunlong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet var tableView:UITableView!
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurant.image)
        
        // change table view background color
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.2)
        
        // remove the extra separator
        self.tableView.tableFooterView = UIView(frame:
            CGRectZero)
        
        // change the color of the separator
        self.tableView.separatorColor = UIColor(red:
                240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0,
                alpha: 0.8)
        
        title = self.restaurant.name
        
        self.tableView.estimatedRowHeight = 36.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        
    }

    override func viewWillAppear(animated: Bool) {
            navigationController?.hidesBarsOnSwipe = false
            self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
                return .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        
        cell.mapButton.hidden = true
        switch indexPath.row {
            case 0:
                cell.fieldLabel.text = "Name"
                cell.valueLabel.text = self.restaurant.name
            case 1:
                cell.fieldLabel.text = "Type"
                cell.valueLabel.text = self.restaurant.type
            case 2:
                cell.fieldLabel.text = "Location"
                cell.valueLabel.text = self.restaurant.location
            case 3:
                cell.fieldLabel.text = "Been Here?"
                cell.valueLabel.text = self.restaurant.isVisited ? "YES! i have been here" : "No"
                cell.mapButton.hidden = false
            default:
                cell.fieldLabel.text = ""
                cell.valueLabel.text = ""
        }
        
        return cell
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
            if segue.identifier == "showMap" {
        
                let destinationController = segue.destinationViewController as MapViewController
                destinationController.restaurant = restaurant
        
            }
            
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
            println("close")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
