//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 yunlong. All rights reserved.
//

import UIKit

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


class RestaurantTableViewController: UITableViewController {

    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

            
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
      
            // create an option menu as action sheet
            let optionMenu = UIAlertController(title: nil, message: "What do you want do?", preferredStyle: .ActionSheet)

            let cancleAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            let callAction = UIAlertAction(title: "Call 123-000-\(indexPath.row)", style: .Default, handler: {
                (action: UIAlertAction!) -> Void in
                let alertMessage = UIAlertController(title: "Service unavailiable", message: "Sorry, the call feature is not yet", preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alertMessage.addAction(okAction)
            
                self.presentViewController(alertMessage, animated: true, completion: nil)
            
            })
            
            let isVisitAction = UIAlertAction(title: "I've been there.", style: .Default, handler: {
                (action: UIAlertAction!) -> Void in
                
                let cell = tableView.cellForRowAtIndexPath(indexPath) as CustomTableViewCell
                //cell?.accessoryType = .Checkmark
                cell.iconImageView.hidden = false
                self.restaurantIsVisited[indexPath.row] = true
                
            })
            
            // add action to menu
            optionMenu.addAction(cancleAction)
            optionMenu.addAction(callAction)
            optionMenu.addAction(isVisitAction)
            
            // displayMenu
            self.presentViewController(optionMenu, animated: true, completion: nil)
            
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}
