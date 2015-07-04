//
//  ViewController.swift
//  SimpleTable
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 yunlong. All rights reserved.
//

import UIKit

var restaurantNames = [
    "Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petitle Oyster", "For Kee Restaurant",
    "Po's Atelier", "Haigh's Chocolate", "Traif", "Graham Avenu Meats And Deli", "Waffle & Wolf",
    "Five Leaves", "Cafe Lore", "Confessional", "Barrafina",
    "Donostia", "Royal Oak", "CASK Pub and Kitenhen"
]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // get the table view the total number of rows in section
        return restaurantNames.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Called every time a table row is displayed.
        
        let cellIdentifuer = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifuer, forIndexPath:indexPath) as UITableViewCell
        
        
        // indexPath.row get the current row
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: "restaurant")
        
        return cell
        
    }

}

