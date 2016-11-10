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
        self.view.backgroundColor = UIColor.white
        
        labelLb = UILabel(frame: CGRect(x: 10 ,y: 10,width: 200,height: 50))
        labelLb?.text = RealtimeData.sharedInstance.dict[itemNum!]["label"]
        self.view.addSubview(labelLb!)
        
        textLb = UILabel(frame: CGRect(x: 10,
            y: 30,
            width: self.view.frame.size.width - 20,
            height: 200))
        textLb?.numberOfLines = 0
        textLb?.lineBreakMode = NSLineBreakMode.byWordWrapping
        textLb?.text = RealtimeData.sharedInstance.dict[itemNum!]["text"]
        self.view.addSubview(textLb!)
        
        valueLb = UILabel(frame: CGRect(x: 10,
            y: self.view.frame.size.height / 2,
            width: self.view.frame.size.width - 10,
            height: 50))
        valueLb?.text = RealtimeData.sharedInstance.dict[itemNum!]["value"]
        
        valueLb?.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        valueLb?.font = UIFont.systemFont(ofSize: CGFloat(35))
        self.view.addSubview(valueLb!)
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.size.height - 44, width: self.view.bounds.size.width, height: 40.0))
        toolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-20.0)
        let closeBt: UIBarButtonItem = UIBarButtonItem(title: "閉じる", style:.plain, target: self, action: #selector(dismissV))
        closeBt.tag = 1
        toolbar.items = [closeBt]
        self.view.addSubview(toolbar)
        
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MMDataDetaileViewController.updateRealTimeValue), userInfo: nil, repeats: true)
    }
    
    // 値の更新
    func updateRealTimeValue() {
        valueLb?.text = RealtimeData.sharedInstance.dict[itemNum!]["value"]
    }
    
    internal func dismissV () {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
