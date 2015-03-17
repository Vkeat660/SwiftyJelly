//
//  MainViewController.swift
//  SwiftyJelly
//
//  Created by Vivian Keating on 3/16/15.
//  Copyright (c) 2015 Vivian Keating. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let jellyView = JellyView()

    class func sharedInstance() -> MainViewController{
        struct Static {
            static let instance = MainViewController()
        }
        return Static.instance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        setupJellyView()
    }
    
    func setupJellyView() {
        
        view.addSubview(jellyView)
        jellyView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let jellyButtonCenterX = NSLayoutConstraint(item: jellyView,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0)
        
        let jellyButtonCenterY = NSLayoutConstraint(item: jellyView,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 0.66,
            constant: 0)
        
        let jellyButtonHeight = NSLayoutConstraint(item: jellyView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 0,
            constant: 88)

        let jellyButtonWidth = NSLayoutConstraint(item: jellyView,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 0,
            constant: 256)
        
        view.addConstraint(jellyButtonCenterX)
        view.addConstraint(jellyButtonCenterY)
        view.addConstraint(jellyButtonHeight)
        view.addConstraint(jellyButtonWidth)
        
    }

}
