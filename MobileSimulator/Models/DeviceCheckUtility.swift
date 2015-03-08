//
//  DeviceCheckUtility.swift
//  MobileSimulator
//
//  Created by Master on 2015/03/08.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class DeviceCheckUtility: NSObject {
    
    func checkDevice(window: UIWindow) {
        var storyboard: UIStoryboard!
        var storyboardName: String!
        let deviceModel = UIDevice.currentDevice().model
        
        if !deviceModel.hasPrefix("iPad") {
            let deviceRect = UIScreen.mainScreen().bounds
            if deviceRect.size.height == 480 {
                storyboardName = "3.5inch"
            }else {
                storyboardName = "Main"
            }
        }else {
            storyboardName = "3.5inch"
        }
        
        storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        window.rootViewController = storyboard.instantiateInitialViewController() as? UIViewController
        window.makeKeyAndVisible()
    }
}
