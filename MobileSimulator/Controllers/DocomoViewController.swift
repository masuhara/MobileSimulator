//
//  DocomoViewController.swift
//  MobileSimulator
//
//  Created by Master on 2015/01/09.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class DocomoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sum: Int = 0
    var plans: [String] = []
    var values: [Int] = []
    var checkMarkArray: [Bool] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.multipleTouchEnabled = true;
        
        setPlans()
        setNavigationBarAttribute()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DCMPlans.sharedInstance.contents.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell");
        
        //Check Mark
        if(checkMarkArray[indexPath.row]) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
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
        
        var cell = tableView?.cellForRowAtIndexPath(indexPath)
        
        if cell?.accessoryType == UITableViewCellAccessoryType.Checkmark {
            checkMarkArray[indexPath.row] = false
            cell?.accessoryType = UITableViewCellAccessoryType.None
            sum = sum - values[indexPath.row]
            priceLabel.text = String(format: "%d", sum)
        }else {
            checkMarkArray[indexPath.row] = true
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            sum = sum + values[indexPath.row]
            priceLabel.text = String(format: "%d", sum)
        }
        
        tableView?.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //var cell = tableView.cellForRowAtIndexPath(indexPath)
        //cell?.accessoryType = UITableViewCellAccessoryType.None
    }

    //MARK:Private
    private func setNavigationBarAttribute() {
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "tabbar_bg_black"), forBarMetrics: .Default)
        navigationController?.navigationBar.barTintColor = UIColor.hexStr("d2203e", alpha: 1.0)
        let titleDictionary: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.titleTextAttributes = titleDictionary
    }
    
    private func setPlans() {
        for key in DCMPlans.sharedInstance.contents.keys{
            plans.append(key)
            for value in DCMPlans.sharedInstance.contents.values{
                values.append(value)
                checkMarkArray.append(false)
            }
        }
    }
    
    @IBAction private func showAboutThisApplication() {
        //Get this version
        let infoDictionary = NSBundle.mainBundle().infoDictionary! as Dictionary
        let bundleVersionString = infoDictionary["CFBundleVersion"]! as String;
        let bundleVersion = NSNumberFormatter().numberFromString(bundleVersionString)!.floatValue
        
        let titleString = String("モバシミュ! v1.0")
        let contentString = String(format: "Copyright\n2015 Gifted.Inc All Rights Reserved.", bundleVersion)
        
        SweetAlert().showAlert(titleString, subTitle: contentString, style: AlertStyle.CustomImag(imageFile: "icon.png"))
        
        /*
        if objc_getClass("UIAlertController") != nil {
        // UIAlertControlle
        var alertController = UIAlertController(title: titleString, message: contentString, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
        }
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        } else {
        // UIAlertView (For iOS 7)
        var alertView = UIAlertView(title: titleString, message: contentString, delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "OK")
        alertView.show()
        }
        */
    }

    
}
