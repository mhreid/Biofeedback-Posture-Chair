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

class Graph: UIView {
    
    var data = [14.0,5.0,7.0,20,3.0, 14.0,5.0,7.0,4.1, 5.3,14.0,5.0,7.0,20,3.0, 14.0,5.0,7.0,4.1, 5.3]{
        didSet{
            //print("needs display")
        }
    }
    
    

    
    @IBInspectable var yMax = 70.0
    @IBInspectable var xMax = 20.0
    let height = 327.0
    let width = 445.0

    override init(frame: CGRect) {
        //print("viewDIdload")
        super.init(frame: UIScreen.main.bounds);
        
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
        
    override func draw(_ rect: CGRect) {
        
        //print("displaying")
        UIColor.white.setFill()
        UIColor.white.setStroke()
        let linePath = UIBezierPath()
        linePath.lineWidth = 4
        linePath.move(to: CGPoint(x: 0, y: height - ( data[data.count -  Int(xMax)] * (height - 10))))
        for i in 1...Int(xMax) {
            linePath.addLine(to: CGPoint(x: Double(i) / xMax * width, y: (height - data[i - Int(xMax) - 1  + (data.count)] * (height - 10))))
        }
        
        linePath.addLine(to: CGPoint(x: 500, y: (height - data[data.count - 1] * (height - 10))))
        //print(data[data.count - 1] / yMax * height)
        linePath.stroke()
    }
    

}






////
//www.midpointz.com:8080/SetGraph/25.33&23.34&13.54
//www.midpointz.com:8080/GetGraph
