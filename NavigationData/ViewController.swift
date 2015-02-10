//
//  ViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/9/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

import UIKit

class ViewController: ResponsiveTextFieldViewController, UIPickerViewDelegate{
    
    @IBOutlet weak var firstContinueButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
