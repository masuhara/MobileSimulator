//
//  VersionChecker.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/26.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class VersionChecker: NSObject {
    
    class func showNewFeatures(viewController: UIViewController) {
        //Get past version
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let loadedVersion = userDefaults.floatForKey("version")
        
        //Get this version
        let infoDictionary = NSBundle.mainBundle().infoDictionary! as Dictionary
        let bundleVersionString = infoDictionary["CFBundleVersion"]! as String;
        
        let bundleVersion = NSNumberFormatter().numberFromString(bundleVersionString)!.floatValue
        
        //Show Information
        if bundleVersion > loadedVersion || loadedVersion == 0{
            
            var titleString = String(format: "バージョン%.1fの新機能", bundleVersion)
            
            if objc_getClass("UIAlertController") != nil {
                // UIAlertControlle
                var alertController = UIAlertController(title: titleString, message: "・auのプランを修正しました。\n・デザインを変更しました。", preferredStyle: .Alert)
                
                let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
                }
                alertController.addAction(okAction)
                
                viewController.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                // UIAlertView (For iOS 7)
                var alertView = UIAlertView(title: titleString, message:"・auのプランを修正しました。\n・デザインを変更しました。", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "OK")
                alertView.show()
            }
            
            //Save current version
            userDefaults.setFloat(bundleVersion, forKey: "version")
        }
    }
}
