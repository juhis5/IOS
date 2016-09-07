//
//  AppDelegate.swift
//  MeetingCostMeter
//
//  Created by developer on 07/09/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    
    var meeting :MeetingCostModel!
    var timer :NSTimer!
    
    var locationManager :CLLocationManager!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        meeting = MeetingCostModel(numberOfParticipants: 4, avarageHourSalary: 100, currency: "Euro")
        meeting.startMeeting()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(printCurrenCost), userInfo: nil, repeats: true)
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        
        
        locationManager.startUpdatingLocation()
        
        return true
    }
    
    //MARK: my own methods
    func printCurrenCost(timer: NSTimer) -> Void {
        print(String(meeting.currentCostOfMeeting))
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        timer.invalidate()
        print(String(meeting.currentCostOfMeeting))
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
    
    //MARK: Delegate methdos
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        meeting.latitude = locations.first?.coordinate.latitude
        meeting.longitude = locations.first?.coordinate.longitude
        print("Latitude : " + String(meeting.latitude!))
        print("Longitude : " + String(meeting.longitude!))
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        print(status)
    }


}

