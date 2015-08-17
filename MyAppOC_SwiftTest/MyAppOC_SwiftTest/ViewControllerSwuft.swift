//
//  ViewControllerSwuft.swift
//  MyAppOC_SwiftTest
//
//  Created by biyabi on 15/7/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

import UIKit
import Foundation

@objc class ViewControllerSwuft: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor(UIColor.blueColor())
        // Do any additional setup after loading the view.
    }

    func changeColor(num : Int) ->String {
        
        self.view.backgroundColor(UIColor.redColor())
        return "order change"
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
