## 账户相关

# 删除账户共享
rm -rf /Users/Shared/Previously\ Relocated
rm -rf /Users/Shared/Relocated\ Items
rm -rf /Users/Shared/AAdobeGCInfo
rm -rf /Users/Shared/AdobeGCData
rm -rf /Users/Shared/adi
rm -rf /Users/Shared/.DS_Store
rm -rf /Users/Shared/.localized
rm -rf /Users/Shared/.locale_cfg
rm -rf /Users/Shared/.SeedEnrollment.plist 

# 删除无用文件
rm -rf /Users/.localized

## 用户相关

# 删除当前账户无用文件
rm -rf ~/.DS_Store 
rm -rf ~/.cache 
rm -rf ~/.sogouinput 
rm -rf ~/.wakatime.log
rm -rf ~/.redhat/anonymousId

## 应用相关

# xcode
# 删除模拟器
rm -rf /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime
rm -rf /Applications/Xcode.app/Contents/Developer/Platforms/WatchOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/watchOS.simruntime
rm -rf /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/tvOS.simruntime
# 删除项目打包文件
rm -rf ~/Library/Developer/Xcode/Archives
# 删除项目的索引文件
rm -rf ~/Library/Developer/Xcode/DerivedData

# wechat
# 删除微信下所有视频缩略图文件
# 8001f6e32d445b31f1ac32c034aaa6e5/Video/1661567239978492.video_thumb.jpg
