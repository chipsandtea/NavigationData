//
//  SchoolSelectionViewController.swift
//  NavigationData
//
//  Created by Christopher Hsiao on 2/10/15.
//  Copyright (c) 2015 Chips&Tea. All rights reserved.
//

import UIKit

class SchoolSelectionViewController: UIViewController, UIPickerViewDelegate {

   
   @IBOutlet weak var schoolPicker: UIPickerView!
   @IBOutlet weak var schoolField: UITextField!
   
   var contents = [String]()
   var dict = [String : String]()
   
   var isSearch = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false);
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

   @IBAction func doSearch(sender: AnyObject) {
      contents = [String]()
      dict = [String : String]()
      
      if(!self.isSearch)
      {
         get(schoolField.text)
      }
   }
   
   func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
      return 1
   }
   
   func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
      return contents.count
   }
   
   func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
   {
      //cData().setObject(self.dict[contents[row]]!, forKey: "id")
   }
   
   func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!{
      return contents[row]
   }
   
   func get(search : String) {
      
      self.isSearch = true
      
      let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
      
      /* Create session, and optionally set a NSURLSessionDelegate. */
      let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
      
      /* Create the Request:
      My API (2) (POST http://oneillseaodyssey.org/testing.php)
      */
      var getUrl = search.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
      var URL = NSURL(string: "http://oneillseaodyssey.org/search.php?search=\(getUrl)")
      let request = NSMutableURLRequest(URL: URL!)
      request.HTTPMethod = "GET"
      
      /* Start a new Task */
      let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
         if (error == nil) {
            // Success
            let statusCode = (response as NSHTTPURLResponse).statusCode
            let json = JSON(data: data)
            
            dispatch_async(dispatch_get_main_queue(), {
               
               for (key: String, subJson: JSON) in json {
                  
                  self.contents.append(subJson["school"].stringValue + " - " + subJson["teacher"].stringValue)
                  self.dict[subJson["school"].stringValue + " - " + subJson["teacher"].stringValue] = subJson["id"].stringValue
                  
               }
               
               self.schoolPicker.reloadAllComponents()
               
            })
            
            
            
         }
         else {
            println("URL Session Task Failed: %@", error.localizedDescription);
         }
         
         self.isSearch = false
      })
      
      task.resume()
   }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestVC: GroupNameViewController = segue.destinationViewController as GroupNameViewController
        //DestVC.school = "Placeholder School"
        //println(self.schoolPicker.selectedRowInComponent(0))
      if(!self.contents.isEmpty) {
        DestVC.school = self.contents[self.schoolPicker.selectedRowInComponent(0)]
        sharedData().setObject(self.dict[contents[self.schoolPicker.selectedRowInComponent(0)]]!, forKey: "school_id")
      }
    }

}
