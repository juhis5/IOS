//
//  firstViewController.swift
//  ios
//
//  Created by developer on 07/09/16.
//  Copyright © 2016 developer. All rights reserved.
//
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var heighField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var resultField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calcBmi(sender: AnyObject) {
        if let heightText :String = heighField.text {
            let mHeight :Double = Double(heightText)!/100
            if let weightText :String = weightField.text {
                let weightDouble : Double = Double(weightText)!
                
                let result :Double = weightDouble/(mHeight*mHeight)
                resultField.text = "Result: " + String(result)
                
            }
        }
        
        
    }
    
}