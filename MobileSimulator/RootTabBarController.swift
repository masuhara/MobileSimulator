//
//  RootTabBarController.swift
//  MobileSimulator
//
//  Created by Master on 2015/01/09.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundImage = UIImage(named: "tabbar_bg_black.png")
        
        setTabBarIcons()
        setTabBarIconsOnSelected()
        setTabBarFonts()
        
        //UITabBar.appearance().tintColor = UIColor.whiteColor()
        //let realm = RLMRealm.defaultRealm()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

}
