//
//  Graph.swift
//  Biofeedback Posture Chair
//
//  Created by Micah Reid on 10/19/16.
//  Copyright © 2016 Micah Reid. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class Graph2: UIView {
    var data = [14.0,5.0,7.0,19.0,3.0]{
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var yMax = 20.0
    @IBInspectable var xMax = 5.0
    let height = 327.0
    let width = 445.0
    
    override func draw(_ rect: CGRect) {
        UIColor.white.setFill()
        UIColor.black.setStroke()
        print("hi")
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: data[0] / yMax * height))
        for i in 1...data.count - 1{
            linePath.addLine(to: CGPoint(x: Double(i) / xMax * width, y: data[i] / yMax * height))
            print(Double(i) / xMax * width)
            print(data[i] / yMax * height)
        }
    }
    
}
