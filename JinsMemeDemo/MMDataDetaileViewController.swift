//
//  MMDataDetaileViewController.swift
//  JinsMemeDemo
//
//  Created by matz on 2015/11/25.
//  Copyright © 2015年 matz. All rights reserved.
//

import UIKit

final class MMDataDetaileViewController: UIViewController {
    
    var itemNum:Int?
    var latestRealTimeData:MEMERealTimeData?
    var labelLb:UILabel?
    var textLb:UILabel?
    var valueLb:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        labelLb = UILabel(frame: CGRectMake(10 ,10,200,50))
        labelLb?.text = RealtimeData.sharedInstance.dict[itemNum!]["label"]
        self.view.addSubview(labelLb!)
        
        textLb = UILabel(frame: CGRectMake(10,
            30,
            self.view.frame.size.width - 20,
            200))
        textLb?.numberOfLines = 0
        textLb?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        textLb?.text = RealtimeData.sharedInstance.dict[itemNum!]["text"]
        self.view.addSubview(textLb!)
        
        valueLb = UILabel(frame: CGRectMake(10,
            self.view.frame.size.height / 2,
            self.view.frame.size.width - 10,
            50))
        valueLb?.text = RealtimeData.sharedInstance.dict[itemNum!]["value"]
        
        valueLb?.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
        valueLb?.font = UIFont.systemFontOfSize(CGFloat(35))
        self.view.addSubview(valueLb!)
        
        let toolbar = UIToolbar(frame: CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 40.0))
        toolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-20.0)
        let closeBt: UIBarButtonItem = UIBarButtonItem(title: "閉じる", style:.Plain, target: self, action: "dismiss")
        closeBt.tag = 1
        toolbar.items = [closeBt]
        self.view.addSubview(toolbar)
        
        NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateRealTimeValue"), userInfo: nil, repeats: true)
    }
    
    // 値の更新
    func updateRealTimeValue() {
        valueLb?.text = RealtimeData.sharedInstance.dict[itemNum!]["value"]
    }
    
    func dismiss () {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
