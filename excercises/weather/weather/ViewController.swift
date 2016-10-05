//
//  ViewController.swift
//  weather
//
//  Created by developer on 05/10/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    var weather :WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.cityName.text = self.weather?.cityName!
            let celcius :Double = (self.weather?.temperature!)! - 273.15
            self.weatherImg.image = UIImage(data: (self.weather?.img)!)
            self.tempLabel.text = String(Double(round(10*celcius)/10)) + "°C"
        }
        
    }
}

