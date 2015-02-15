//
//  AUViewController.swift
//  MobileSimulator
//
//  Created by Master on 2015/01/09.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class AUViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var texts = ["LTEプラン=980円", "通話ワイド24", "au通話定額", "LTEネット=300円", "電話きほんパック", "ビデオパス", "スマートパス", "うたパス", "ブックパス", "アニメパス", "ディズニーパス", "LTEフラット=5,700円"]
    //参考:http://mobilego22.tanken-go.com/2013/12/13/2427
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count;
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell");
        
        //add optional
        cell.textLabel?.text = texts[indexPath.row];
        return cell;
    }
    
    //MARK:TableView Delegate
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        var text: String = texts[indexPath.row];
        println(text);
    }
    
    
}
