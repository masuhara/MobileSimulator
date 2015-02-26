//
//  SBPlans.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/19.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class SBPlans: NSObject {
    class var sharedInstance : SBPlans {
        struct Static {
            static let instance : SBPlans = SBPlans()
        }
        return Static.instance
    }
    
    let contents = Dictionary<String, Int>()
    
    private override init() {
        contents = [
            "パケット定額":5460,
            "Wホワイト":1008,
            "スマートフォン基本パック":540,
            "あんしん保証パック":540,
            "あんしん保証パックプラス":702,
            "iPhone基本パック":540,
            "UULA":504,
            "Yahoo!プレミアム For SoftBank":399,
            "ケータイ基本パック":540,
            "ホワイトプラン":1008,
            "S!ベーシックパック":324,
            "ホワイト家族24":0,
            "ホワイトコール24":0,
            "カーナビプラン":216,
            "あんしん保証パックライト":324,
            "チャリティホワイト":10,
            "ソフトバンクWi-Fiスポット":540,
            "スマホ得するパック":540,
            "アニメ放題":432,
            "契約事務手数料":3240]
        //参考:http://mobilego22.tanken-go.com/2013/11/18/1519
    }

}
