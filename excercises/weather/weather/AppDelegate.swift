//
//  AppDelegate.swift
//  weather
//
//  Created by developer on 05/10/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?

    let apiKey = "appid=c9dfb45d4259857799e80607db19ea5b"
    
    let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
    
    var v1 : ViewController!
    var v2 : ForecastViewController!
    var locationManager :CLLocationManager!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        var controllers = (window!.rootViewController as! UITabBarController).viewControllers
        self.v1 = controllers?[0] as! ViewController
        self.v2 = controllers?[1] as! ForecastViewController
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        
        let latLon = "&lat=\(locations.first?.coordinate.latitude)&lon=\(locations.first?.coordinate.longitude)"
        let url = baseUrl + apiKey + latLon
        let nsUrl = NSURL.init(string: url)
        
        
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(nsUrl!) {
            (let data, let response, let err) in
            guard let _:NSData = data, let _:NSURLResponse = response  where err == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(dataString)
            
            do{
                let json = try
                    NSJSONSerialization.JSONObjectWithData(
                        data!,
                        options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                let main = json["main"] as! NSDictionary
                let wethArr = json["weather"] as! NSArray
                
                let wethObj = wethArr[0] as! NSDictionary
                let icon = wethObj["icon"] as! String
                
                let city = json["name"] as! String
                let temp = main["temp"] as! Double
                
                NSLog("ICON : " + icon)
                let imageURL = "http://openweathermap.org/img/w/\(icon).png"
                
                let imageData = NSData(contentsOfURL: NSURL(string: imageURL)!);
                
                let weatherModel = WeatherModel.init(cityName: city, temperature: temp, image: imageData)
                
                self.v1.weather = weatherModel
                
                self.v1.update()
                
                NSLog("Temp : " + String(temp))
                NSLog("City : " + city)
                
            } catch {
                
            }
        }
        task.resume()
    }
}

