//
//  CompletedViewController.swift
//  NavigationData
//
//  Created by Christopher Hsiao on 2/23/15.
//  Copyright (c) 2015 Chips&Tea. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hitGroupSelect(sender: AnyObject) {
        self.navigationController!.popToViewController(self.navigationController!.viewControllers[2] as UIViewController, animated: true)
    }

    @IBAction func hitSchoolSelect(sender: AnyObject) {
        self.navigationController!.popToViewController(self.navigationController!.viewControllers[1] as UIViewController, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false);
        navigationController?.setNavigationBarHidden(true, animated: true)
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
