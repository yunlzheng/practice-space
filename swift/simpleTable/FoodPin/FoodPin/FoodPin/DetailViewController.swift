//
//  DetailsViewController.swift
//  FoodPin
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 yunlong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var restaurantImageView: UIImageView!
    var restaurantImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurantImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
