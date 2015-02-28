//
//  ScheduleViewController.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/26.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate {
    
    var contractData: NSMutableArray = NSMutableArray()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Parse
        loadData { (objects, error) -> () in
            self.contractData = NSMutableArray(array: objects)
            self.collectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /*
        if section == 0 {
            return 5
        }else if section == 1 {
            return 4
        }else if section == 2 {
            return 3
        }else {
            return 0
        }
        */
        return contractData.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as CircuitCollectionViewCell
        
        let underContractArray:PFObject = self.contractData.objectAtIndex(indexPath.row) as PFObject
        
        
        // Calc Days
        let calendar = NSCalendar(calendarIdentifier: NSJapaneseCalendar)!
        let contractDate = underContractArray.valueForKey("startDate") as NSDate
        let currentDate = NSDate()
        NSLog("cont %@", contractDate)
        NSLog("cur %@", currentDate)
        var days = DateUtility.calcDaysBetween(contractDate, endDate: currentDate)
        
        // Format
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        // Cell Contents
        cell.titleLabel.text = underContractArray.objectForKey("carrier") as? String
        cell.dateLabel.text = String(days)
        cell.startDateLabel.text = dateFormatter.stringFromDate(DateUtility.adjustZeroClock(contractDate, calendar: calendar))
        
        // Background Color
        let carrierString: String = cell.titleLabel.text!
        switch carrierString {
        case "au":
            cell.imageView.backgroundColor = UIColor.orangeColor()
        case "docomo":
            cell.imageView.backgroundColor = UIColor.hexStr("d2203e", alpha: 1.0)
        case "softbank":
            cell.imageView.backgroundColor = UIColor.hexStr("c0c0c0", alpha: 1.0)
        default:
            break
        }
        
        return cell
    }
    
    // MARK: Private
    private func loadData(callback:([PFObject]!, NSError!) -> ())  {
        var query: PFQuery = PFQuery(className: "UnderContract")
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            if (error != nil){
                // エラー処理
            }
            callback(objects as [PFObject], error)
        }
    }
    
    @IBAction private func addCircuit() {
        //回線の追加
        var date = NSDate()
        
        var testObject:PFObject = PFObject(className: "UnderContract")
        testObject.setObject("au", forKey: "carrier")
        testObject.setObject(date, forKey: "startDate")

        testObject.saveInBackground()
        
        //numberOfRows++
        collectionView.reloadData()
    }
    
    @IBAction private func longPressed(sender: UILongPressGestureRecognizer) {
        
    }
    
}
