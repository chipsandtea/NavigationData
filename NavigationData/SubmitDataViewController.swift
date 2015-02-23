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
    
}
