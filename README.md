[![GitHub stars](https://img.shields.io/github/stars/fluttercandies/ncov_2019)](https://github.com/fluttercandies/ncov_2019/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/fluttercandies/ncov_2019)](https://github.com/fluttercandies/ncov_2019/network)
[![GitHub issues](https://img.shields.io/github/issues/fluttercandies/ncov_2019)](https://github.com/fluttercandies/ncov_2019/issues) 

> 如果产生其他依赖无法编译的问题，可以尝试将`pubspec.yaml`中的`dependencies`中的所有依赖的"^"去掉，重新编译尝试。

# nCoV_2019

获取新肺炎实时动态App，支持Android和IOS。

# Log
* 2020.07.04 - 适配Flutter 1.17

* 2020.02.16 - 修复统计图不能展示问题。（16:45）

* 2020.02.16 - 辟谣卡片标题最大行数调整为2行，统计数据布局优化。（16:32）

* 2020.02.16 - 完美适配Flutter1.12.13和Androidx（13:21）

* 2020.02.06 - 修复了统计信息出错和诊疗无图标和对齐问题。

* 2020.02.02 - 修复了统计的分隔符导致统计数据无法正常显示。

# 项目相关文章

* [Flutter Candies又添一成员，为抗击疫情贡献一份技术力量](https://mp.weixin.qq.com/s?__biz=MzAxMTI4MTkwNQ==&mid=2650829796&idx=1&sn=7811875471dcabd0cfec788adc27306a&chksm=80b7a77ab7c02e6cfc9726c61be31cbd616c5593d0b9388776f15fd255ccc619be7df38341b3&mpshare=1&scene=23&srcid&sharer_sharetime=1582430519570&sharer_shareid=bdfd1967c1c7dae7e61a030ea5b2b235%23rd)


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

在`pubspec.yaml`文件中，关于flutter版本使用`cached_network_image`插件问题，默认使用2.0.0，
因为你们刚安装上flutter为最新版本flutter。
```yaml
#  cached_network_image: 1.1.1 # 1.9.0左右flutter版本的用这个
  cached_network_image: 2.0.0 # 2.0.0左右flutter版本直接用这个
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
q1deMacBook-Pro:ncov_2019 q1$ flutter doctor -v
[✓] Flutter (Channel stable, 1.20.2, on Mac OS X 10.14.5 18F2059, locale zh-Hans-CN)
    • Flutter version 1.20.2 at /Users/q1/flutter
    • Framework revision bbfbf1770c (3 weeks ago), 2020-08-13 08:33:09 -0700
    • Engine revision 9d5b21729f
    • Dart version 2.9.1
    • Pub download mirror https://pub.flutter-io.cn
    • Flutter download mirror https://storage.flutter-io.cn


[✓] Android toolchain - develop for Android devices (Android SDK version 29.0.3)
    • Android SDK at /Users/q1/Library/Android/sdk
    • Platform android-29, build-tools 29.0.3
    • ANDROID_HOME = /Users/q1/Library/Android/sdk
    • Java binary at: /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6222593)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 11.3)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Xcode 11.3, Build version 11C29
    • CocoaPods version 1.8.4

[✓] Android Studio (version 4.0)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin version 48.1.2
    • Dart plugin version 193.7361
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6222593)

[✓] VS Code (version 1.47.3)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.12.2

[✓] Connected device (1 available)
    • sdk gphone x86 arm (mobile) • emulator-5554 • android-x86 • Android 11 (API 30) (emulator)

• No issues found!
```

# 意见反馈
如果大家有好的意见或者有好的设计图的话可以群内找我。

Flutter交流QQ群：[874592746](https://jq.qq.com/?_wv=1027&k=5coTYqE)

Flutter交流微信群：

<img src="assets/git/left_group.png" height="200" width="210" style="zoom:30%;" />

[上图无法显示点我](http://www.flutterj.com/left_group.png)


### LICENSE
```
fluttercandies/ncov_2019 is licensed under the
Apache License 2.0

A permissive license whose main conditions require preservation of copyright and license notices. 
Contributors provide an express grant of patent rights. 
Licensed works, modifications, and larger works may be distributed under different terms and without source code.
```
