//
//  WeatherModel.swift
//  weather
//
//  Created by developer on 05/10/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//

import Foundation

class WeatherModel {
    var cityName :String?
    var temperature :Double?
    var img :NSData?
    
    init(cityName: String , temperature: Double, image: NSData?) {
        self.cityName = cityName
        self.temperature = temperature
        self.img = image
    }
}