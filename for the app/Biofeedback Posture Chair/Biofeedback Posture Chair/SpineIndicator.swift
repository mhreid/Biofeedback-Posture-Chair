//
//  SpineIndicator.swift
//  Biofeedback Posture Chair
//
//  Created by Micah Reid on 10/21/16.
//  Copyright © 2016 Micah Reid. All rights reserved.
//

import Foundation
import UIKit

class SpineIndicator: UIView{
    let red = [255,0,0]
    let yellow = [255,328,0]
    let green = [0,217,0]
    var value = 0.0
    var color = UIColor.black
    override func draw(_ rect: CGRect) {

        //print("value: " + String(value))
        if(value < 0.5){
            //red-yellow
            color = UIColor(colorLiteralRed: 255 , green: Float(red[1]) + Float(yellow[1] - red[1]) * Float(value / 20), blue: 0, alpha: 1)
            print(Float(red[1]) + Float(yellow[1]) * Float(value));
            //color = UIColor.blue
        }
        if(value > 0.5){
            //yellow-green
            var newColor = [0.0,0.0,0.0]
            newColor[0] = (Double(yellow[0]) + Double(green[0] - yellow[0]) * value )
            newColor[1] = (Double(yellow[1]) + Double(green[1] - yellow[1]) * value)
            newColor[2] = (Double(yellow[2]) + (Double(green[2] - yellow[2])) * Double(value))
            color = UIColor(colorLiteralRed: Float(Double(green[0]) + Double(green[0] + yellow[0]) *  (1 - value) / 200
            ) , green: Float(Double(yellow[1]) - (Double(yellow[1] - green[1]) * (value / 20))) , blue: Float(Double(yellow[2]) + (Double(green[2] - yellow[2])) * 1), alpha: 1)
        

            //color = UIColor.yellow
        }
        color.setFill()
        color.setStroke()
        let circle : UIBezierPath = UIBezierPath(ovalIn :CGRect(x: 0, y: 0, width: self.bounds.height, height: self.bounds.height))
        circle.fill()
        let path: UIBezierPath = UIBezierPath()
        path.lineWidth = 5
        path.move(to: CGPoint(x: 0, y: self.bounds.height / 2))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height / 2))
        path.stroke()
        
    }
    
    
}
