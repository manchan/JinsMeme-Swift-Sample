//
//  RealtimeData.swift
//  JinsMemeDemo
//
//  Created by matz on 2015/11/25.
//  Copyright © 2015年 matz. All rights reserved.
//

import UIKit

final class RealtimeData: NSObject {
    
    var data:MEMERealTimeData?
    var dict = [Dictionary<String, String>]()
    struct Singleton {
        static let sharedInstance = RealtimeData()
    }
    
    class var sharedInstance: RealtimeData {
        return Singleton.sharedInstance
    }
    
    func memeRealTimeModeDataReceived(_ data: MEMERealTimeData) {
        self.data = data
        guard let d = self.data as MEMERealTimeData? else { return }
        let fitStatus = [
            "label" : "Fit Status",
            "text" : "JINS MEMEがきちんと装着されているかどうかを示す整数値。\n" +
                "0：エラーなし\n" +
                "1：左鼻パッドエラー\n" +
                "2：右鼻パッドエラー\n" +
            "3：ブリッジエラー\n",
            "value" : NSString(format: "%d", d.fitError) as String
        ]
        let isWalking = [
            "label" : "isWalking",
            "text" : "歩行判定:かかとを地面についたかどうか。それを検出するとtrueになる",
            "value" : NSString(format: "%d", d.isWalking) as String
        ]
        let powerLeft = [
            "label" : "Power Left",
            "text" : "電池残量を表す整数値\n" +
                "0：充電中\n" +
                "1：低電圧\n" +
                "2：Lv2\n" +
                "3：Lv3\n" +
                "4：Lv4\n" +
            "5：満充電",
            "value" : NSString(format: "%d", d.powerLeft) as String
        ]
        let eyeMoveUp = [
            "label" : "Eye Move Up",
            "text" : "視線が上に動いたかどうかを示す整数値\n" +
                "0：なし\n" +
                "1：移動検知ー小\n" +
                "2：移動検知ー中\n" +
                "3：逆移動検知ー大\n" +
            "4：逆移動検知ー特大\n",
            "value" : NSString(format: "%d", d.eyeMoveUp) as String
        ]
        let eyeMoveDown = [
            "label" : "Eye Move Down",
            "text" : "視線が下に動いたかどうかを示す整数値\n" +
                "0：なし\n" +
                "1：移動検知ー小\n" +
                "2：移動検知ー中\n" +
                "3：逆移動検知ー大\n" +
            "4：逆移動検知ー特大\n",
            "value" : NSString(format: "%d", d.eyeMoveDown) as String
        ]
        let eyeMoveLeft = [
            "label" : "Eye Move Left",
            "text" : "視線が左に動いたかどうかを示す整数値\n" +
                "0：なし\n" +
                "1：移動検知ー小\n" +
                "2：移動検知ー中\n" +
                "3：逆移動検知ー大\n" +
            "4：逆移動検知ー特大\n",
            "value" : NSString(format: "%d", d.eyeMoveLeft) as String
        ]
        let eyeMoveRight = [
            "label" : "Eye Move Right",
            "text" : "視線が右に動いたかどうかを示す整数値\n" +
                "0：なし\n" +
                "1：移動検知ー小\n" +
                "2：移動検知ー中\n" +
                "3：逆移動検知ー大\n" +
            "4：逆移動検知ー特大\n",
            "value" : NSString(format: "%d", d.eyeMoveRight) as String
        ]
        let blinkStrength = [
            "label" : "Blink Strength",
            "text" : "まばたきの強さ (一般的に、50～200の間におさまります。)" ,
            "value" : NSString(format: "%d", d.blinkStrength) as String
        ]
        let blinkSpeed = [
            "label" : "Blink Speed",
            "text" : "まばたきのスピード（Millisecond）" ,
            "value" : NSString(format: "%d", d.blinkSpeed) as String
        ]
        let roll = [
            "label" : "Roll",
            "text" : "姿勢を表す角度のうちのロール要素を示す度" ,
            "value" : NSString(format: "%.2f", d.roll) as String
        ]
        let pitch = [
            "label" : "Pitch",
            "text" : "姿勢を表す角度のうちのピッチ要素を示す度" ,
            "value" : NSString(format: "%.2f", d.pitch) as String
        ]
        let yaw = [
            "label" : "Yaw",
            "text" : "姿勢を表す角度のうちのヨー要素を示す度" ,
            "value" : NSString(format: "%.2f", d.yaw) as String
        ]
        let accX = [
            "label" : "Acc X",
            "text" : "加速度のX軸の値。-128 ~ 127 の1byteの整数値" ,
            "value" : NSString(format: "%d", d.accX) as String
        ]
        let accY = [
            "label" : "Acc Y",
            "text" : "加速度のY軸の値。-128 ~ 127 の1byteの整数値" ,
            "value" : NSString(format: "%d", d.accY) as String
        ]
        let accZ = [
            "label" : "Acc Z",
            "text" : "加速度のZ軸の値。-128 ~ 127 の1byteの整数値" ,
            "value" : NSString(format: "%d", d.accZ) as String
        ]
        RealtimeData.sharedInstance.dict = [
            fitStatus,
            isWalking,
            powerLeft,
            eyeMoveUp,
            eyeMoveDown,
            eyeMoveLeft,
            eyeMoveRight,
            blinkStrength,
            blinkSpeed,
            roll,
            pitch,
            yaw,
            accX,
            accY,
            accZ
        ]
    }
}
