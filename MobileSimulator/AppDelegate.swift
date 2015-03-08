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

    var window: UIWindow!//unwrapped

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Badge
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
        // GoogleAnalytics
        setGoogleAnalytics()
        
        // Parse
        let id = "g2uV2wiA4nVb1yqVRcIcMryPFNAEPBC3TUWTgLCA"
        let key = "iYMr1MqMcbExNa24nHxfp48DjcjRJmEF7MnDdQ0d"
        Parse.setApplicationId(id, clientKey: key)
        PFUser.enableAutomaticUser()
        var defaultACL = PFACL()
        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser: true)
        notificationSetting(application)
        
        
        // Version Check
        var viewController = self.window?.rootViewController
        VersionChecker.showNewFeatures(viewController!)
        
        // Device Check
        let hoge = DeviceCheckUtility()
        hoge.checkDevice(window)//unwrapped

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
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        application.registerForRemoteNotifications()
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        // if you do not import Bolts.framework, this code say error
        installation.saveInBackground()
    }
    
    func application( application: UIApplication!, didFailToRegisterForRemoteNotificationsWithError error: NSError! ) {
        
        println( error.localizedDescription )
    }
    
    private func setGoogleAnalytics() {
        GAI.sharedInstance().trackUncaughtExceptions = true;
        GAI.sharedInstance().dispatchInterval = 20
        GAI.sharedInstance().logger.logLevel = .Info
        GAI.sharedInstance().trackerWithTrackingId("UA-59993460-3")
    }
    
    private func notificationSetting(application: UIApplication) {
        var currentVersion = (UIDevice.currentDevice().systemVersion as NSString).floatValue
        if currentVersion >= 8.0{
            var types:UIUserNotificationType = UIUserNotificationType.Badge | UIUserNotificationType.Alert | UIUserNotificationType.Sound
            var settings: UIUserNotificationSettings = UIUserNotificationSettings( forTypes: types, categories: nil )
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        }else{
            var types:UIRemoteNotificationType = UIRemoteNotificationType.Badge | UIRemoteNotificationType.Alert | UIRemoteNotificationType.Sound
            application.registerForRemoteNotificationTypes(types)
        }
    }
}

