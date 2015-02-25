//
//  AUViewController.swift
//  MobileSimulator
//
//  Created by Master on 2015/01/09.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class AUViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var plans: [String] = []
    var values: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setPlans()
        setNavigationBarAttribute()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AUPlans.sharedInstance.contents.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell");
        
        //Cell Appearance
        cell.textLabel?.text = plans[indexPath.row]
        cell.textLabel?.font = UIFont(name: "FOT-ComicReggae Std", size: 16)
        cell.detailTextLabel?.text = String(format: "%d 円/月", values[indexPath.row])
        cell.detailTextLabel?.font = UIFont(name: "FOT-ComicReggae Std", size: 11)
        return cell;
    }
    
    //MARK:TableView Delegate
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        var text: String = plans[indexPath.row];
        println(text);
    }
    
    
    //MARK:Private
    private func setNavigationBarAttribute() {
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "tabbar_bg_black"), forBarMetrics: .Default)
        navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
        let titleDictionary: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.titleTextAttributes = titleDictionary
    }
    
    private func setPlans() {
        for key in AUPlans.sharedInstance.contents.keys{
            plans.append(key)
            for value in AUPlans.sharedInstance.contents.values{
                values.append(value)
            }
        }
    }
    
}
