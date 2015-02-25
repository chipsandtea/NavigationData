//
//  SubmitDataViewController.swift
//  NavigationData
//
//  Created by Christopher Hsiao on 2/10/15.
//  Copyright (c) 2015 Chips&Tea. All rights reserved.
//

import UIKit

class SubmitDataViewController: UIViewController {
    
    
    @IBOutlet var bannerLabel: UILabel!
    var groupName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerLabel.text = "Submit Data for: " + groupName + " ?"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @IBAction func submitFormData(sender: AnyObject)
   {
      var json = JSON(sharedData())
      self.sendRequest(json)
   }
   
   func get(completedFunction : (json: JSON) ->()) {
      
      let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
      
      /* Create session, and optionally set a NSURLSessionDelegate. */
      let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
      
      /* Create the Request:
      My API (2) (POST http://oneillseaodyssey.org/testing.php)
      */
      
      var URL = NSURL(string: "http://oneillseaodyssey.org/applications.php")
      let request = NSMutableURLRequest(URL: URL!)
      request.HTTPMethod = "GET"
      var myJson = JSON([1,2])
      
      /* Start a new Task */
      let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
         if (error == nil) {
            // Success
            let statusCode = (response as NSHTTPURLResponse).statusCode
            let json = JSON(data: data)
            
            dispatch_async(dispatch_get_main_queue(), {
               
               for (key: String, subJson: JSON) in json {
                  
                  //self.contents.append(subJson["school"].stringValue)
                  //self.dict[subJson["school"].stringValue] = subJson["id"].stringValue
                  
               }
               //if(self.schoolPicker != nil) {
               //  self.schoolPicker.reloadAllComponents()
               //}
            })
            
            
            
         }
         else {
            println("URL Session Task Failed: %@", error.localizedDescription);
         }
      })
      
      task.resume()
   }
   
   func sendRequest(params : JSON) {
      
      let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
      
      /* Create session, and optionally set a NSURLSessionDelegate. */
      let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
      
      /* Create the Request:
      My API (2) (POST http://oneillseaodyssey.org/testing.php)
      */
      
      var URL = NSURL(string: "http://oneillseaodyssey.org/parsetest.php")
      let request = NSMutableURLRequest(URL: URL!)
      request.HTTPMethod = "POST"
      
      
      var foo = params.rawString(options:nil)
      if let string : String = foo {
         
         let bodyParameters = [
            "data" : string
         ]
         
         println(string)
         
         let bodyString = stringFromQueryParameters(bodyParameters)
         println ("bodyString:", bodyString);
         request.HTTPBody = bodyString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
         
         /* Start a new Task */
         let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
            if (error == nil) {
               // Success
               let statusCode = (response as NSHTTPURLResponse).statusCode
               println("URL Session Task Succeeded: HTTP \(statusCode)")
               println("returned data, should be identical:")
               var results = NSString(data: data, encoding: NSUTF8StringEncoding)!
               results = results.stringByReplacingOccurrencesOfString("\\", withString: "")
               println(results)
            }
            else {
               // Failure
               println("URL Session Task Failed: %@", error.localizedDescription);
            }
         })
         task.resume()
      }
   }
   
   func stringFromQueryParameters(queryParameters : Dictionary<String, String>) -> String {
      var parts: [String] = []
      for (name, value) in queryParameters {
         var part = NSString(format: "%@=%@",
            name.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!,
            value.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
         parts.append(part)
      }
      return "&".join(parts)
   }
   
   func NSURLByAppendingQueryParameters(URL : NSURL!, queryParameters : Dictionary<String, String>) -> NSURL {
      let URLString : NSString = NSString(format: "%@?%@", URL.absoluteString!, stringFromQueryParameters(queryParameters))
      return NSURL(string: URLString)!
   }
}
