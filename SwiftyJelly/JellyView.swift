//
//  JellyView.swift
//  SwiftyJelly
//
//  Created by Vivian Keating on 3/16/15.
//  Copyright (c) 2015 Vivian Keating. All rights reserved.
//

import UIKit

class JellyView: UIView {
    
    private let shapeLayer = CAShapeLayer()
    private var topLeft : CGPoint = CGPointZero
    private var topRight : CGPoint = CGPointZero
    private var bottomLeft : CGPoint = CGPointZero
    private var bottomRight : CGPoint = CGPointZero
    
    private var displayLink : CADisplayLink!
    
    private var time : CFTimeInterval = 5

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        displayLink  = CADisplayLink(target: self, selector: "reDraw:")
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "buttonTapped")
        self.addGestureRecognizer(tapGesture)
        
        shapeLayer.fillColor = UIColor("#F44336").CGColor
        
        // for performance
        shapeLayer.drawsAsynchronously = true
        
        layer.addSublayer(shapeLayer)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
        
            let x0 = bounds.origin.x
            let y0 = bounds.origin.y
            let Δx = bounds.size.width
            let Δy = bounds.size.height
        
            topLeft     = CGPoint(x: x0 +  0, y: y0 +  0)
            topRight    = CGPoint(x: x0 + Δx, y: y0 +  0)
            bottomLeft  = CGPoint(x: x0 +  0, y: y0 + Δy)
            bottomRight = CGPoint(x: x0 + Δx, y: y0 + Δy)
        
            drawPath()

    }
    
    func buttonTapped(){
        time = 0
    }
    
    
    func reDraw(link : CADisplayLink)->(){
        
        time += link.duration
        
        if time < 4.0 {
           drawPath()
        }
        
    }
    
    func drawPath(){
        
        let offset  = CGFloat(1600.0 * time * Double(sin(time * π * 2.0 / 0.4))           * Double(exp(-5.0 * time)))
        let offset2 = CGFloat(1400.0 * time * Double(sin(time * π * 2.0 / 0.4 + π * 0.9)) * Double(exp(-5.0 * time)))
        
        let controlPoint1 = CGPoint(x: (topLeft.x      + topRight.x              )/2,
                                    y: (topLeft.y      + topRight.y    - offset2 )/2)
        let controlPoint2 = CGPoint(x: (topRight.x     + bottomRight.x + offset  )/2,
                                    y: (topRight.y     + bottomRight.y           )/2)
        let controlPoint3 = CGPoint(x: (bottomRight.x  + bottomLeft.x            )/2,
                                    y: (bottomRight.y  + bottomLeft.y  + offset2 )/2)
        let controlPoint4 = CGPoint(x: (bottomLeft.x   + topLeft.x     - offset  )/2,
                                    y: (bottomLeft.y   + topLeft.y               )/2)
        
        let path = UIBezierPath()
        path.moveToPoint(topLeft)
        path.addQuadCurveToPoint(topRight,    controlPoint: controlPoint1)
        path.addQuadCurveToPoint(bottomRight, controlPoint: controlPoint2)
        path.addQuadCurveToPoint(bottomLeft,  controlPoint: controlPoint3)
        path.addQuadCurveToPoint(topLeft,     controlPoint: controlPoint4)
        path.closePath()
        
        shapeLayer.path = path.CGPath

    }
    
    deinit {
        displayLink.invalidate()
    }
}