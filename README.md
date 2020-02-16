# nCoV_2019

获取新肺炎实时动态App，支持Android和IOS。

# Log
* 2020.02.16 - 辟谣卡片标题最大行数调整为2行，统计数据布局优化。

* 2020.02.16 - 完美适配Flutter1.12.13和Androidx

* 2020.02.06 - 修复了统计信息出错和诊疗无图标和对齐问题。

* 2020.02.02 - 修复了统计的分隔符导致统计数据无法正常显示。

# 项目描述

* [项目起因及描述看这里](https://juejin.im/post/5e2c6a6e51882526b757cf2e)
* [本项目介绍文章](https://juejin.im/post/5e2c8ba3e51d4557e86e9b8c)

# App体验
##### Android 下载地址:
[http://www.flutterj.com/nCoV-2019.apk](http://www.flutterj.com/nCoV-2019.apk)

##### Android（二维码下载）:

![download.png](assets/git/download.png)

IOS:

拉下代码直接跑即可

# App效果图
|![home.png](assets/git/home.png)| ![rumor1.png](assets/git/rumor1.png) | ![rumor2.png](assets/git/rumor2.png) | ![rumor3.png](assets/git/rumor3.png) |
| --- | --- | --- | --- |
|![protect1.png](assets/git/protect1.png)| ![protect2.png](assets/git/protect2.png) | ![protect3.png](assets/git/protect3.png) | ![lore.png](assets/git/lore.png) |

# 使用须知
* cached_network_image

在`pubspec.yaml`文件中，关于flutter版本使用`cached_network_image`插件问题，默认使用any，
因为你们刚安装上flutter为最新版本flutter。
```yaml
#  cached_network_image: ^1.1.1 # 1.9.0左右flutter版本的用这个
  cached_network_image: any # 2.0.0左右flutter版本直接用any
```

# 使用教程

*  使用命令（拉取项目）：$ git clone https://github.com/fluttercandies/ncov_2019.git
*  然后命令（获取依赖）：$ flutter packages get  (IOS执行IOS部分再执行下一步)
*  最后命令（运行）：$ flutter run

IOS
*  进入项目IOS目录：$ cd ios/
*  更新Pod（非必须）：$ pod update
*  安装Pod：$ pod install

# 我的Flutter环境
```
q1deMacBook-Pro:~ q1$ flutter doctor -v
[✓] Flutter (Channel unknown, v1.12.13, on Mac OS X 10.14.5 18F2059, locale
    zh-Hans-CN)
    • Flutter version 1.12.13 at /Users/q1/flutter
    • Framework revision cf37c2cd07 (3 months ago), 2019-11-25 12:04:30 -0800
    • Engine revision b6b54fd606
    • Dart version 2.7.0

[✓] Android toolchain - develop for Android devices (Android SDK version 29.0.2)
    • Android SDK at /Users/q1/Library/Android/sdk
    • Android NDK location not configured (optional; useful for native profiling
      support)
    • Platform android-29, build-tools 29.0.2
    • ANDROID_HOME = /Users/q1/Library/Android/sdk
    • Java binary at: /Applications/Android
      Studio.app/Contents/jre/jdk/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build
      1.8.0_202-release-1483-b49-5587405)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 11.3)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Xcode 11.3, Build version 11C29
    • CocoaPods version 1.8.4

[✓] Android Studio (version 3.5)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin version 42.1.1
    • Dart plugin version 191.8593
    • Java version OpenJDK Runtime Environment (build
      1.8.0_202-release-1483-b49-5587405)

[✓] Connected device (2 available)
    • Android SDK built for x86 • emulator-5554                        •
      android-x86 • Android 10 (API 29) (emulator)
    • iPhone 11 Pro Max         • 083FB0DB-0531-41FA-8C94-EADF5F884353 • ios
      • com.apple.CoreSimulator.SimRuntime.iOS-13-3 (simulator)

• No issues found!
```

# 意见反馈
如果大家有好的意见或者有好的设计图的话可以群内找我。

Flutter交流QQ群：[874592746](https://jq.qq.com/?_wv=1027&k=5coTYqE)

Flutter交流微信群：

![](https://user-gold-cdn.xitu.io/2020/1/27/16fe2f50329f799c?w=512&h=512&f=jpeg&s=49463)