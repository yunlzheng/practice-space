//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 yunlong. All rights reserved.
//

import UIKit




class RestaurantTableViewController: UITableViewController {

    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster",
        "ForKee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate",
        "PalominoEspresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf",
        "Five Leaves", "CafeLore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg",
        "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg",
        "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg",
        "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg",
        "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "HongKong", "Hong Kong", "Hong Kong", "Hong Kong",
            "HongKong", "Hong Kong", "Sydney", "Sydney", "Sydney",
            "New York", "New York", "New York", "New York", "NewYork",
            "New York", "New York", "London", "London",
            "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop",
        "Cafe", "Tea House", "Austrian / Causual Drink",
        "French", "Bakery", "Bakery", "Chocolate", "Cafe",
        "American / Seafood", "American", "American",
        "Breakfast & Brunch", "Coffee & Tea", "Coffee &Tea", "Latin American", "Spanish", "Spanish",
        "Spanish", "British", "Thai"]
    
            
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
            
            let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {
                (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
        
                let shareMenu = UIAlertController(title: nil, message: "Share Using.", preferredStyle: .ActionSheet)
        
                let qqAction = UIAlertAction(title: "QQ", style: UIAlertActionStyle.Default, handler: nil)
                let weiboAction = UIAlertAction(title: "Weibo", style: UIAlertActionStyle.Default, handler: nil)
                let weChatAction = UIAlertAction(title: "WeChat", style: UIAlertActionStyle.Default, handler: nil)
                let cancleAction = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Cancel, handler: nil)
        
                shareMenu.addAction(qqAction)
                shareMenu.addAction(weiboAction)
                shareMenu.addAction(weChatAction)
                shareMenu.addAction(cancleAction)
        
                self.presentViewController(shareMenu, animated: true, completion: nil)
            
            })
            
            let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {
                (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
        
        
                self.restaurantNames.removeAtIndex(indexPath.row)
                self.restaurantTypes.removeAtIndex(indexPath.row)
                self.restaurantLocations.removeAtIndex(indexPath.row)
                self.restaurantIsVisited.removeAtIndex(indexPath.row)
                self.restaurantImages.removeAtIndex(indexPath.row)
        
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
            })
            
            shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            deleteAction.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        
            return [shareAction, deleteAction]
    }
            
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifiler = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifiler, forIndexPath: indexPath) as CustomTableViewCell
        
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])

            
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
            
        if self.restaurantIsVisited[indexPath.row] {
            //cell.accessoryType = .Checkmark
            cell.iconImageView.hidden = false
        }else {
            cell.iconImageView.hidden = true
        }
            
        return cell
        
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//            
//            tableView.deselectRowAtIndexPath(indexPath, animated: false)
//      
//            // create an option menu as action sheet
//            let optionMenu = UIAlertController(title: nil, message: "What do you want do?", preferredStyle: .ActionSheet)
//
//            let cancleAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//            
//            let callAction = UIAlertAction(title: "Call 123-000-\(indexPath.row)", style: .Default, handler: {
//                (action: UIAlertAction!) -> Void in
//                let alertMessage = UIAlertController(title: "Service unavailiable", message: "Sorry, the call feature is not yet", preferredStyle: .Alert)
//                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
//                alertMessage.addAction(okAction)
//            
//                self.presentViewController(alertMessage, animated: true, completion: nil)
//            
//            })
//            
//            let isVisitAction = UIAlertAction(title: "I've been there.", style: .Default, handler: {
//                (action: UIAlertAction!) -> Void in
//                
//                let cell = tableView.cellForRowAtIndexPath(indexPath) as CustomTableViewCell
//                //cell?.accessoryType = .Checkmark
//                cell.iconImageView.hidden = false
//                self.restaurantIsVisited[indexPath.row] = true
//                
//            })
//            
//            // add action to menu
//            optionMenu.addAction(cancleAction)
//            optionMenu.addAction(callAction)
//            optionMenu.addAction(isVisitAction)
//            
//            // displayMenu
//            self.presentViewController(optionMenu, animated: true, completion: nil)
//            
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        print(segue.identifier)
    
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as DetailViewController
                //destinationController.restaurantImage = self.restaurantImages[indexPath.row]
                destinationController.restaurantImage = self.restaurantImages[indexPath.row]
    
            }
        }
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}
