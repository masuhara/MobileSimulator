//
//  ScheduleViewController.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/26.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var numberOfRows: Int = 0
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Parse
        loadData { (pictures, error) -> () in
            //self.pictures = pictures
            self.collectionView.reloadData()
        }
        
        // Calc Days
        let dateX = NSDate()
        let dateY = NSDate().dateByAddingTimeInterval(60*60*24*8)
        var num = DateUtility.calcDaysBetween(dateX, endDate: dateY)
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
        return numberOfRows
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as CircuitCollectionViewCell
        cell.titleLabel.text = "hoge"
        cell.dateLabel.text  = "hoge"
        cell.backgroundColor = UIColor.blackColor()
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
        
        var date = NSDate()
        
        var testObject:PFObject = PFObject(className: "UnderContract")
        testObject.setObject("au", forKey: "carrier")
        testObject.setObject(date, forKey: "startDate")

        testObject.saveInBackground()
        
        
        numberOfRows++
        collectionView.reloadData()
    }

}
