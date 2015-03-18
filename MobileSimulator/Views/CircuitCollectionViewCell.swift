//
//  CircuitCollectionViewCell.swift
//  MobileSimulator
//
//  Created by Master on 2015/02/26.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class CircuitCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "hundleLongPress:")
        longPress.minimumPressDuration = 3.0
        longPress.delegate = self
        self.addGestureRecognizer(longPress)
        
    }
    
    func longPressGesture(sender: UILongPressGestureRecognizer){
    
        if(sender.state == UIGestureRecognizerState.Ended){
            NSLog("%@", sender)
        }
    }
}




