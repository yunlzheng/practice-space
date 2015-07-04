//
//  ViewController.swift
//  helloApp
//
//  Created by apple on 15/7/3.
//  Copyright (c) 2015年 moo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMessage() {
        
        let alertController = UIAlertController(title: "Welcome To My App", message: "Hello Wwrld", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }


}

