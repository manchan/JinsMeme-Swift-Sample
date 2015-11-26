//
//  MMDataViewController.swift
//  JinsMemeDemo
//
//  Created by matz on 2015/11/21.
//  Copyright © 2015年 matz. All rights reserved.
//

import UIKit

final class MMDataViewController: UITableViewController {

    var indicatorView:UIView?
    var latestRealTimeData:MEMERealTimeData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "RealTime Data"
        self.indicatorView = UIView(frame: CGRectMake(0, 0, 24, 24))
        self.indicatorView?.alpha = 0.20
        self.indicatorView?.backgroundColor = UIColor.whiteColor()
        self.indicatorView?.layer.cornerRadius = (self.indicatorView?.frame.size.height)! * 0.5
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.indicatorView!)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Disconnect", style: UIBarButtonItemStyle.Plain, target: self, action:  Selector("disconnectButtonPressed"))
    }
    
    func disconnectButtonPressed(){
        MEMELib.sharedInstance().disconnectPeripheral()
    }
    
    func memeRealTimeModeDataReceived(data: MEMERealTimeData) {
        
        self.blinkIndicator()
//        print("RealTime Data Received \(data.description)")
        self.latestRealTimeData = data
        self.tableView.reloadData()
    }
    
    func blinkIndicator(){
        
        UIView.animateWithDuration(0.05, animations: { () -> Void in

            self.indicatorView?.backgroundColor = UIColor.redColor()
            
            }) { (finished:Bool) -> Void in
                
                UIView.animateWithDuration(0.05, delay: 0.02, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                    
                    self.indicatorView?.backgroundColor = UIColor.whiteColor()
                    
                    }, completion: nil)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DataCellIdentifier", forIndexPath: indexPath)

        var label = ""
        var value = ""
        
        if let data = self.latestRealTimeData as MEMERealTimeData?{
            
            switch indexPath.row {
            case 0:
                
                /****************
                JINS MEMEがきちんと装着されているかどうかを示す整数値。
                0：エラーなし
                1：左鼻パッドエラー
                2：右鼻パッドエラー
                3：ブリッジエラー
                ****************/
                
                
                label = "Fit Status";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 1:

                /****************
                歩行判定:かかとを地面についたかどうか。それを検出するとtrueになる
                ****************/

                
                label = "isWalking";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 2:
                
                /****************
                電池残量を表す整数値
                0：充電中
                1：低電圧
                2：Lv2
                3：Lv3
                4：Lv4
                5：満充電
                ****************/
                

                label = "Power Left";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 3:
                
                /****************
                *視線が上に動いたかどうかを示す整数値
                *0：なし
                *1：移動検知ー小
                *2：移動検知ー中
                *3：逆移動検知ー大
                *4：逆移動検知ー特大
                ****************/
                
                
                label = "Eye Move Up";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 4:
                
                /****************
                視線が下に動いたかどうかを示す整数値
                0：なし
                1：移動検知ー小
                2：移動検知ー中
                3：逆移動検知ー大
                4：逆移動検知ー特大
                ****************/
                
                
                label = "Eye Move Down";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 5:
                
                /****************
                視線が左に動いたかどうかを示す整数値
                0：なし
                1：移動検知ー小
                2：移動検知ー中
                3：逆移動検知ー大
                4：逆移動検知ー特大
                ****************/
                
                
                label = "Eye Move Left";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 6:
                
                /****************
                視線が右に動いたかどうかを示す整数値
                0：なし
                1：移動検知ー小
                2：移動検知ー中
                3：逆移動検知ー大
                4：逆移動検知ー特大
                ****************/
                
                
                label = "Eye Move Right";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 7:
                
                /****************
                まばたきの強さ (一般的に、50～200の間におさまります。)
                ****************/
                
                
                label = "Blink Streangth";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 8:
                
                /****************
                まばたきのスピード（Millisecond）
                ****************/
                
                
                label = "Blink Speed";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
                
            case 9:
                
                /****************
                姿勢を表す角度のうちのロール要素を示す度
                ****************/
                
                label = "Roll";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 10:
                
                
                /****************
                姿勢を表す角度のうちのピッチ要素を示す度
                ****************/
                
                label = "Pitch";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 11:
                
                /****************
                姿勢を表す角度のうちのヨー要素を示す度
                ****************/
                
                label = "Yaw";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 12:
                
                /****************
                加速度のX軸の値。-128 ~ 127 の1byteの整数値
                ****************/
                
                
                label = "Acc X";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 13:
                
                /****************
                加速度のY軸の値。-128 ~ 127 の1byteの整数値
                ****************/
                
                label = "Acc Y";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            case 14:
                
                /****************
                加速度のZ軸の値。-128 ~ 127 の1byteの整数値
                ****************/
                
                
                label = "Acc Z";
                value = RealtimeData.sharedInstance.dict[indexPath.row]["value"]!
                break
            default:
                break
            }
            
            
            cell.textLabel?.text = label
            cell.detailTextLabel?.text = value
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        let tw:Int = indexPath.row
        let vc = MMDataDetaileViewController()
        vc.itemNum = tw
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}