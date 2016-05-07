//
//  ViewController.swift
//  Share
//
//  Created by Samuel Putnam on 5/7/16.
//  Copyright © 2016 SamPutnam. All rights reserved.
//

import UIKit
import Social
import Accounts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func facebookButton(sender: AnyObject) {
        
        let url: NSURL = NSURL(string: "http://www.google.com")!
        let fbControl = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        fbControl.setInitialText("")
        fbControl.addURL(url)
        
        let completionHandler = {(result: SLComposeViewControllerResult) -> () in fbControl.dismissViewControllerAnimated(true, completion: nil)
            switch(result) {
            case SLComposeViewControllerResult.Cancelled:
                print("User canceled", terminator: "")
            case SLComposeViewControllerResult.Done:
                print("User posted", terminator: "")
            }
        }
        fbControl.completionHandler = completionHandler
        self.presentViewController(fbControl, animated: true, completion: nil)
    }
    
    @IBAction func twitterButton(sender: AnyObject) {
    
        let image: UIImage = UIImage(named: "TwitterLogo.png")!
        
        let twitterControl = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterControl.setInitialText("")
        twitterControl.addImage(image)
        
        let completionHandler = {(result:SLComposeViewControllerResult) -> () in
            twitterControl.dismissViewControllerAnimated(true, completion: nil)
            switch(result){
            case SLComposeViewControllerResult.Cancelled:
                print("User canceled", terminator: "")
            case SLComposeViewControllerResult.Done:
                print("User tweeted", terminator: "")
            }
    }
        twitterControl.completionHandler = completionHandler
        self.presentViewController(twitterControl, animated: true, completion: nil)

}
}