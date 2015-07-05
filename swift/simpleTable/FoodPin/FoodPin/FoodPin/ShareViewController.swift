//
//  ShareViewController.swift
//  FoodPin
//
//  Created by apple on 15/7/5.
//  Copyright (c) 2015年 yunlong. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blueEffectView = UIVisualEffectView(effect: blurEffect)
        
        blueEffectView.frame = view.frame
        
        backgroundImageView.addSubview(blueEffectView)
        
        let translateGroup1 = CGAffineTransformMakeTranslation(0, 1000)
        let translateGroup2 = CGAffineTransformMakeTranslation(0, -1000)
        
        facebookButton.transform = translateGroup1
        messageButton.transform = translateGroup1
        twitterButton.transform = translateGroup2
        emailButton.transform = translateGroup2
        
        
    }

    override func viewDidAppear(animated: Bool) {
        
        // Spring animation
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.5, options: nil, animations: {
                self.facebookButton.transform = CGAffineTransformMakeTranslation(0, 0)
                self.twitterButton.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 0.1, usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.5, options: nil, animations: {
                self.messageButton.transform = CGAffineTransformMakeTranslation(0, 0)
                self.emailButton.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        
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
