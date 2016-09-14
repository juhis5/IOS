//
//  ViewController.swift
//  MeetingCostMeter
//
//  Created by developer on 07/09/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController  {
    @IBOutlet weak var meetingButton: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var nameOfMeting: UITextField!
    @IBOutlet weak var participantAmount: UITextField!
    @IBOutlet weak var loadingCircle: UIActivityIndicatorView!

    @IBOutlet weak var avarageSalary: UITextField!
    
    var meeting :MeetingCostModel!
    var timer :NSTimer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(!loadingCircle.isAnimating()){
            loadingCircle.startAnimating()
        }
        loadingCircle.hidesWhenStopped = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func startMeeting(sender: AnyObject) {
        if(meeting.isMeetingOn) {
            stopMeeting()
            
        } else {
            startMeeting()
        }
    }
    
    //MARK: my own methods
    func printCurrenCost(timer: NSTimer) -> Void {
        var cost : Double = meeting.currentCostOfMeeting
        cost = round(100*cost)/100
        
        costLabel.text = String(cost) + " €"
    }
    
    func startMeeting() {
        var pIntAmont : Int = 0
        var salaryInt : Double = 0
        
        if let pAmount : String = participantAmount.text {
            pIntAmont = Int(pAmount)!
        } else {
            return;
        }
        
        if let salary : String = avarageSalary.text{
            salaryInt = Double(salary)!
        } else {
            return;
        }
        
        meeting.avarageHourSalary = salaryInt
        meeting.currency = "Euro"
        meeting.numberOfParticipants = pIntAmont
        
        meeting.startMeeting()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(printCurrenCost), userInfo: nil, repeats: true)
        
        meetingButton.setTitle("Stop meeting", forState: UIControlState.Normal)
    }
    
    
    func stopMeeting() -> Void {
        if (timer != nil){
            timer.invalidate()
            meeting.endMeeting()
            meetingButton.setTitle("Start meeting", forState: UIControlState.Normal)
        }
    }
    
    func updateName(location: CLLocation) {
        let geoCoder = CLGeocoder.init()
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            if error == nil && placemarks!.count > 0 {
                let location = placemarks![0] as CLPlacemark
                self.nameOfMeting.text = "\(location.locality!), \(location.thoroughfare!)"
            }
        })
        
        loadingCircle.stopAnimating()
        
    }
    
    func nameUpdateDone() -> Void {
        
    }
}

