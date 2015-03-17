//
//  MainViewController.swift
//  SwiftyJelly
//
//  Created by Vivian Keating on 3/16/15.
//  Copyright (c) 2015 Vivian Keating. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    class func sharedInstance() -> MainViewController{
        struct Static {
            static let instance = MainViewController()
        }
        return Static.instance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.orangeColor()
        
        
    }

}
