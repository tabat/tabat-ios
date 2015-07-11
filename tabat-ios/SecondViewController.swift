//
//  SecondViewController.swift
//  tabat-ios
//
//  Created by 涵冷 on 7/9/15.
//  Copyright (c) 2015 涵冷. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signin(sender: UIButton) {
        let urlPath: String = "http://127.0.0.1:3000/api/v1/sessions.json"
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        request1.HTTPMethod = "POST"
        var stringPost="loginName=\(loginName.text)&password=\(password.text)"
        
        let data = stringPost.dataUsingEncoding(NSUTF8StringEncoding)
        
        request1.timeoutInterval = 60
        request1.HTTPBody=data
        request1.HTTPShouldHandleCookies=false
        
        let queue:NSOperationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError
            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            println("AsSynchronous\(jsonResult)")
        })

    }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        loginName.resignFirstResponder()
        password.resignFirstResponder()
    }
}

