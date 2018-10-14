//
//  ViewController.swift
//  Biofeedback Posture Chair
//
//  Created by Micah Reid on 10/18/16.
//  Copyright © 2016 Micah Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var graph: Graph!
    @IBOutlet weak var topSpine: SpineIndicator!
    var timer = Timer()
    @IBOutlet weak var midSpine: SpineIndicator!
    @IBOutlet weak var bottomSpine: SpineIndicator!
    @IBOutlet weak var topRightSpine: SpineIndicator!
    @IBOutlet weak var midRightSpine: SpineIndicator!
    @IBOutlet weak var bottomRightSpine: SpineIndicator!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateGraph), userInfo: nil, repeats: true)
                
    }
    func updateGraph(){
        graph.setNeedsDisplay()
        self.topSpine.setNeedsDisplay()
        self.midSpine.setNeedsDisplay()
        self.bottomSpine.setNeedsDisplay()
        self.topRightSpine.setNeedsDisplay()
        self.midRightSpine.setNeedsDisplay()
        self.bottomRightSpine.setNeedsDisplay()

        print("test")
        let requestUrl : NSURL = NSURL(string: "http://www.midpointz.com:8080/GetGraph")!
        let urlRequest :NSMutableURLRequest = NSMutableURLRequest(url: requestUrl as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest){
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200){
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject]
                    
                    let sensor1 = (json["sensor1"] as? NSNumber)?.doubleValue
                    let sensor2 = (json["sensor2"] as? NSNumber)?.doubleValue
                    let sensor3 = (json["sensor3"] as? NSNumber)?.doubleValue
                    let upperLeft = Double(Int(sensor1!)) / 1000.0
                    let upperRight = (sensor1?.truncatingRemainder(dividingBy: 1))! * 10.0
                    let middleLeft = Double(Int(sensor2!)) / 1000.0
                    let middleRight = (sensor2?.truncatingRemainder(dividingBy: 1))! * 10.0
                    let lowerLeft = Double(Int(sensor3!)) / 1000.0
                    let lowerRight = (sensor3?.truncatingRemainder(dividingBy: 1))! * 10.0
                    let averageReading = (upperRight + upperLeft + middleRight + middleLeft + lowerRight + lowerLeft) / 6
                    print(averageReading)
                    self.graph.data.append(averageReading)
                    self.topSpine.value = Double(upperLeft)
                    self.midSpine.value = Double(middleLeft)
                    self.bottomSpine.value = Double(lowerLeft)
                    self.topRightSpine.value = Double(upperRight)
                    self.midRightSpine.value = Double(middleRight)
                    self.bottomRightSpine.value = Double(lowerRight)
                    print (sensor1!)

                } catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        task.resume()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

