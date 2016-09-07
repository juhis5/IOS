//
//  MyViewController.swift
//  ios
//
//  Created by developer on 07/09/16.
//  Copyright © 2016 developer. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelFrame = CGRect(x: 10, y: 20, width: 500, height: 50)
        let buttonFrame = CGRect(x: 150 , y: 300, width: 100, height: 100)
        let heightFrame = CGRect(x: 10, y: 150, width: 100, height: 20)
        let weightFrame = CGRect(x: 120, y: 150, width: 100, height: 20)
        
        let heightField = UITextField.init(frame: heightFrame)
        let weightField = UITextField.init(frame: weightFrame)
        
        heightField.text = "Height in cm";
        weightField.text = "Weight in kg";
        
        let label = UILabel.init(frame: labelFrame)
        label.backgroundColor = UIColor.cyanColor()
        label.text = "BMI CALCULATOR";
        
        let button = UIButton.init(type: UIButtonType.RoundedRect)
        
        button.setTitle("click!", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.blueColor()
        button.frame = buttonFrame;
        
        button.addTarget(self, action: #selector(method), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(label)
        self.view.addSubview(button)
        self.view.addSubview(heightField)
        self.view.addSubview(weightField)
    }
    
    func method(v: UIView) -> Void {
        print("Clicked!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}