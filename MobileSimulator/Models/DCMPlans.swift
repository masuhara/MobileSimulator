//
//  DCMPlans.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/19.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class DCMPlans: NSObject {
    class var sharedInstance : DCMPlans {
        struct Static {
            static let instance : DCMPlans = DCMPlans()
        }
        return Static.instance
    }
    
    let contents = Dictionary<String, Int>()

    private override init() {
        contents = ["Xiカケ・ホーダイ":720,
                    "ドコモ地図ナビ":324,
                    "ドコモ ドライブネット":324,
                    "dビデオ":540,
                    "dアニメストア":432,
                    "dヒッツ":324,
                    "dマガジン":432,
                    "NOTTV":432,
                    "050Plus":324,
                    "おすすめパック":540,
                    "あんしんパック":648,
                    "オプションパック割引":432,
                    "iチャネル":162,
                    "I Bodymo":162,
                    "ケータイデータお預かりサービス":0,
                    "お預かりプラス":108,
                    "イマドコサーチ":216,
                    "つながりほっとサポート":0,
                    "iモード":324,
                    "spモード":324,
                    "mopera U":540,
                    "iコンシェル(iモード)":216,
                    "iコンシェル(スマホ)":108,
                    "スゴ特コンテンツ":410,
                    "dキッズ":390,
                    "ドライブネット":315]
        //参考:http://mobilego22.tanken-go.com/2013/10/30/924
    }
}
