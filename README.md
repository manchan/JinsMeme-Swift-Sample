# J!NS MEME Swift Sample

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)


Code examples for J!NS MEME Realtime data display.  
Using JINS MEME SDK version 1.0.5.


## Requirements

- iOS 9.0+
- J!NS MEME Device

##How to build

JUST BUILD with **Xcode 7**.  
Please set AppClientId / ClientScecret at developer site  
And edit `AppDelegate.swift` at line 20  
More info at https://developers.jins.com/ja/apps/create/  


##Contents

<img src="https://raw.githubusercontent.com/manchan/JinsMeme-Swift-Sample/master/ResourcesForREADME/meme2.gif" align="left" hspace="1">


<br clear="both">



###eyeMoveUp

視線が上に動いたかどうかを示す整数値  

###eyeMoveDown

視線が下に動いたかどうかを示す整数値  

###eyeMoveLeft

視線が左に動いたかどうかを示す整数値  

###eyeMoveRight

視線が右に動いたかどうかを示す整数値  

###blinkSpeed

まばたきのスピード（Millisecond）  

###blinkStrength

まばたきの強さ (一般的に、50～200の間におさまります。)  

###walking

かかとを地面についたかどうか。それを検出するとtrueになる  

###roll
姿勢を表す角度のうちのロール要素を示す度  
###pitch
姿勢を表す角度のうちのピッチ要素を示す度  
###yaw
姿勢を表す角度のうちのヨー要素を示す度  

###accX
加速度のX軸の値。-128 ~ 127 の1byteの整数値  

###accY
加速度のY軸の値。-128 ~ 127 の1byteの整数値  

###accZ
加速度のZ軸の値。-128 ~ 127 の1byteの整数値  

###fitError
JINS MEMEがきちんと装着されているかどうかを示す整数値。  

###powerLeft
電池残量を表す整数値  


### More information is here [JINS MEME（ミーム） DEVELOPERS](https://developers.jins.com/ja/resource/docs/startup_guide/ios/)!!




##Author

**Yuichi Matsuoka** (Freelance Web and iOS engineer)

- [Twitter](https://twitter.com/you_matz)
- [Facebook](https://www.facebook.com/yuichi.124)
- [LinkedIn](https://www.linkedin.com/profile/view?id=AAMAAAQgOl4B6ggRChqY39yVWKwVf7fiuynsTU4)
- [Blog (Japanese)](http://yuichi-dev.blogspot.jp/)


