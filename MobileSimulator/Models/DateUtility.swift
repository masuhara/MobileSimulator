//
//  DateUtility.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/26.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class DateUtility: NSObject {
   
    class private func adjustZeroClock(date: NSDate, calendar: NSCalendar) -> NSDate {
        var components = calendar.components(NSCalendarUnit.YearCalendarUnit|NSCalendarUnit.MonthCalendarUnit|NSCalendarUnit.DayCalendarUnit|NSCalendarUnit.HourCalendarUnit|NSCalendarUnit.MinuteCalendarUnit|NSCalendarUnit.SecondCalendarUnit,
            fromDate: date)
        
        return calendar.dateFromComponents(components)!
    }
    
    
    class func calcDaysBetween(startDate: NSDate, endDate: NSDate) -> NSInteger {
        //iOS 8
        //let cal = NSCalendar(identifier: NSJapaneseCalendar)!
        
        //iOS 7
        let cal = NSCalendar(calendarIdentifier: NSJapaneseCalendar)!
        
        var startDate = adjustZeroClock(startDate, calendar:cal)
        var endDate = adjustZeroClock(endDate, calendar:cal)
        
        var components = cal.components(NSCalendarUnit.DayCalendarUnit, fromDate: startDate, toDate: endDate, options: NSCalendarOptions.allZeros)
        
        var days = components.day
        return days
    }
}
