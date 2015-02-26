//
//  Extension.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/25.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class Extension: NSObject {
   
}

extension UIColor {
    class func hexStr (var hexStr : NSString, var alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
}

public class UIDatePickerTextField: UITextField {
    
    override public func awakeFromNib() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleFocused:"), name: UITextFieldTextDidBeginEditingNotification, object: nil)
    }
    
    public func handleFocused(notification: NSNotification!) {
        var datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        self.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    public func handleDatePicker(sender: UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        super.text = dateFormatter.stringFromDate(sender.date)
    }
}
