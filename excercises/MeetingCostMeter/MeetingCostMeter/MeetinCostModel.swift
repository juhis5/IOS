//
//  MeetinCostModel.swift
//  MeetingCostMeter
//
//  Created by developer on 07/09/16.
//  Copyright © 2016 Juho Lahtinen. All rights reserved.
//
import Foundation


class MeetingCostModel {
    var avarageHourSalary :Double
    var isMeetingOn :Bool
    var numberOfParticipants :Int
    var latitude :Double?
    var longitude :Double?
    var startMeetingDate :NSDate?
    var currency :String
    
    init(numberOfParticipants: Int, avarageHourSalary: Double, currency: String) {
        self.numberOfParticipants = numberOfParticipants
        self.avarageHourSalary = avarageHourSalary
        self.currency = currency
        
        isMeetingOn = false
    }
    
    func startMeeting() {
        isMeetingOn = true
        startMeetingDate = NSDate()
    }
    
    func getCurrentCostOfMeeting() ->Double {
        let tmpDate = NSDate()
        let returnable :Double
        
         timeInterval :
        
        if let startDate :NSDate = startMeetingDate {
            let timeInterval :NSTimeInterval = tmpDate.timeIntervalSinceDate(startDate)
            let hours = (timeInterval / 3600)
            
            returnable = Double(numberOfParticipants)*avarageHourSalary*hours
            
        }else {
            returnable = 0.0
        }
        return returnable
    }
    
    func endMeeting() {
        isMeetingOn = false
    }
}