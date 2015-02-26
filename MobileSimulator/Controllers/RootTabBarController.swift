//
//  RootTabBarController.swift
//  MobileSimulator
//
//  Created by Master on 2015/01/09.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController, UITabBarControllerDelegate, GADInterstitialDelegate{
    
    var interstitial:GADInterstitial = GADInterstitial()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        UITabBar.appearance().backgroundImage = UIImage(named: "tabbar_bg_black.png")
        
        setTabBarIcons()
        setTabBarIconsOnSelected()
        setTabBarFonts()
        
        //UITabBar.appearance().tintColor = UIColor.whiteColor()
        //let realm = RLMRealm.defaultRealm()
        
        //MARK:AdMob Interstitial
        interstitial.adUnitID = "ca-app-pub-6363351251362748/7717543510"
        interstitial.delegate = self
        interstitial.loadRequest(GADRequest())
    }
    
    override func viewDidAppear(animated: Bool) {
        GAI.sharedInstance().defaultTracker.set(kGAIScreenName, value: "Main Screen")
        GAI.sharedInstance().defaultTracker.send(GAIDictionaryBuilder.createScreenView().build())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TabBarController Delegate
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        var selectedIndex = tabBarController.selectedIndex
        if selectedIndex == 1 {
            showInterstitialAd()
        }
    }
    
    //MARK:Private
    private func setTabBarIcons() {
        // tabbar icons
        var au_tabBarItem = self.tabBar.items![0] as UITabBarItem;
        var docomo_tabBarItem = self.tabBar.items![1] as UITabBarItem;
        var sb_tabBarItem = self.tabBar.items![2] as UITabBarItem;
        
        au_tabBarItem.image = UIImage(named: "au_deselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        docomo_tabBarItem.image = UIImage(named: "docomo_deselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        sb_tabBarItem.image = UIImage(named: "softbank_deselected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
    }
    
    private func setTabBarIconsOnSelected() {
        // tabbar icons
        var au_tabBarItem = self.tabBar.items![0] as UITabBarItem;
        var docomo_tabBarItem = self.tabBar.items![1] as UITabBarItem;
        var sb_tabBarItem = self.tabBar.items![2] as UITabBarItem;
        
        au_tabBarItem.selectedImage = UIImage(named: "au_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        docomo_tabBarItem.selectedImage = UIImage(named: "docomo_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        sb_tabBarItem.selectedImage = UIImage(named: "softbank_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
    }
    
    private func setTabBarFonts() {
        // font
        var au_tabBarItem = self.tabBar.items![0] as UITabBarItem;
        var docomo_tabBarItem = self.tabBar.items![1] as UITabBarItem;
        var sb_tabBarItem = self.tabBar.items![2] as UITabBarItem;
        
        let font:UIFont! = UIFont(name:"FOT-ComicReggae Std",size:10);
        let selectedAttributes:NSDictionary! = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor.whiteColor()];
        au_tabBarItem.setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected);
        docomo_tabBarItem.setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected);
        sb_tabBarItem.setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected);
        
    }
    
    //MARK:Interstitial Ad
    private func showInterstitialAd() {
        
        if interstitial.isReady {
            interstitial.presentFromRootViewController(self)
        } else {
            NSLog("is Not Ready")
        }
    }
    
    //MARK:Interstitial Ad Delegate
    func interstitialDidReceiveAd(ad: GADInterstitial!) {
        NSLog("Get Ready")
    }
    
}
