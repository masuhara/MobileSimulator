//
//  AppDelegate.swift
//  MobileSimulator
//
//  Created by Master on 2015/01/09.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIAlertViewDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        setGoogleAnalytics()
        checkVersion()

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
    
    private func setGoogleAnalytics() {
        GAI.sharedInstance().trackUncaughtExceptions = true;
        GAI.sharedInstance().dispatchInterval = 20
        GAI.sharedInstance().logger.logLevel = .Info
        GAI.sharedInstance().trackerWithTrackingId("UA-59993460-3")
    }

    private func checkVersion() {
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
                
                self.window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                // UIAlertView (For iOS 7)
                var alertView = UIAlertView(title: titleString, message:"・auのプランを修正しました。\n・デザインを変更しました。", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "OK")
                alertView.show()
            }
            
            //Save current version
            userDefaults.setFloat(bundleVersion, forKey: "version")
        }
    }


}

