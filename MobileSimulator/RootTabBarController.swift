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
        
        // tabbar icons
        var au_tabBarItem = self.tabBar.items![0] as UITabBarItem;
        au_tabBarItem.image = UIImage(named: "anzuchang_au.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        var docomo_tabBarItem = self.tabBar.items![1] as UITabBarItem;
        docomo_tabBarItem.image = UIImage(named: "anzuchang_do.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        var sb_tabBarItem = self.tabBar.items![2] as UITabBarItem;
        sb_tabBarItem.image = UIImage(named: "anzuchang_sb.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        // font
        let font:UIFont! = UIFont(name:"ComicReggaeStd-B",size:10);
        let selectedAttributes:NSDictionary! = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor.redColor()];
        
        NSLog("%@", font)
        au_tabBarItem.setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
