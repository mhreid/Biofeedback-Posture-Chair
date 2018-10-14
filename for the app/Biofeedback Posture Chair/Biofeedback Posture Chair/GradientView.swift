//
//  GradientView.swift
//  Biofeedback Posture Chair
//
//  Created by Micah Reid on 10/20/16.
//  Copyright © 2016 Micah Reid. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class GradientView: UIView{
    
    @IBInspectable var startColor : UIColor = UIColor.white
    @IBInspectable var endColor : UIColor = UIColor.black
    
    override func draw(_ rect: CGRect) {
        
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        //5 - create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)
        
        //6 - draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        context!.drawLinearGradient(gradient!,
                                    start: startPoint,
                                    end: endPoint,
                                    options: CGGradientDrawingOptions(rawValue: UInt32(0)))
    }
    
}
