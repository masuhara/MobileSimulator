//
//  AUPlans.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/19.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit


class AUPlans: NSObject {
    
    
    
    class var sharedInstance : AUPlans {
        struct Static {
            static let instance : AUPlans = AUPlans()
        }
        return Static.instance
    }
    
    let contents = Dictionary<String, Int>()
    
    private override init() {
        self.contents = ["auスマートパス":401,
            "Apple Care":432,
            "auスマートサポート":3240,
            "テザリングオプション":540,
            "電話基本パック":324,
            "Wi-Fi HOME SPOT":540,
            "LTEプラン":1008,
            "LTE NET":324,
            "LTE フラット":6156,
            "au通話定額24":515,
            "通話ワイド24":1008,
            "au Wi-Fi SPOT":504,
            "安心ケータイサポートプラス":410,
            "ビデオパス":606,
            "うたパス":324,
            "ブックパス":606,
            "アニメパス":432,
            "ディズニーパス":401,
            "EZ WIN":324,
            "IS NET":324,
            "契約事務手数料":3240,
            "転出事務手数料":2160,
            "誰でも割契約解除料金":10260]
        //参考:http://mobilego22.tanken-go.com/2013/12/13/2427
        
        var hoge: String?
        hoge = "a"
        NSLog("%@", hoge!)
    }
}
