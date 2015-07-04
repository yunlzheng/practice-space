//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 yunlong. All rights reserved.
//

import UIKit




class RestaurantTableViewController: UITableViewController {

    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong",image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg",isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image:"teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong",image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image:"petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image:"forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image:"posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image:"bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image:"haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney",image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image:"upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg",isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "NewYork", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image:"wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image:"fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image:"cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image:"confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image:"barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image:"donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image:"royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image: "thaicafe.jpg",isVisited: false)
        ]
    
            
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
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
        
                self.restaurants.removeAtIndex(indexPath.row)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
            })
            
            shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            deleteAction.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        
            return [shareAction, deleteAction]
    }
            
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifiler = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifiler, forIndexPath: indexPath) as CustomTableViewCell
        let restaurant = restaurants[indexPath.row]
                    
        cell.thumbnailImageView.image = UIImage(named: restaurant.image)

            
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.nameLabel.text = restaurant.name
        
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        
            
        if restaurant.isVisited {
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
                destinationController.restaurantImage = self.restaurants[indexPath.row].image
    
            }
        }
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}
