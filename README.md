
<p align="center">
  <img src ="https://github.com/amrangry/NYTimes/blob/master/project-logo-png.png?raw=true"/>
                     https://github.com/amrangry/NYTimes/blob/master/project-logo-png.png
</p>

# ScreenCaptureDetector

[![CI Status](https://img.shields.io/travis/amrangry/ScreenCaptureDetector.svg?style=flat)](https://travis-ci.org/amrangry/ScreenCaptureDetector)
[![Version](https://img.shields.io/cocoapods/v/ScreenCaptureDetector.svg?style=flat)](https://cocoapods.org/pods/ScreenCaptureDetector)
[![License](https://img.shields.io/cocoapods/l/ScreenCaptureDetector.svg?style=flat)](https://cocoapods.org/pods/ScreenCaptureDetector)
[![Platform](https://img.shields.io/cocoapods/p/ScreenCaptureDetector.svg?style=flat)](https://cocoapods.org/pods/ScreenCaptureDetector)

---

##  About
---
  ScreenCaptureDetector is heler tool that can detect if the application is being capture via mirror screen or recorded in addition to screenshot alert 
   * adds an overlay to your app when it is capture or mirrored


##  Picture says a thousand words
---

![Alt text](https://github.com/amrangry/NYTimes/blob/master/project_demo_gif.gif?raw=true "sample")


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Swift 5 

## Installation

CocoaPods

ScreenCaptureDetector is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ScreenCaptureDetector'
```

## How To Use

Simply import ScreenBlocker-iOS in AppDelegate:
import ScreenBlocker_iOS

Add the following to AppDelegate's applicationWillResignActive:
ScreenBlocker.shared.show()
or
ScreenBlocker.shared.show(bgColor: UIColor.someColor)

Add the following to AppDelegate's applicationDidBecomeActive:
ScreenBlocker.shared.hide()

## Environment
---
```ruby
Xcode Version 11.3.1
```
```ruby
Swift 5.0
```

## Contributing 🤘
---
All your feedback and help to improve this project is very welcome. Please create issues for your bugs, ideas and enhancement requests, or better yet, contribute directly by creating a PR. 😎

When reporting an issue, please add a detailed instruction, and if possible a code snippet or test that can be used as a reproducer of your problem. 💥

When creating a pull request, please adhere to the current coding style where possible, and create tests with your code so it keeps providing an awesome test coverage level 💪

## Author

amrangry,

WebSite: [https://amrangry.github.io/](https://amrangry.github.io/)

Email : amr.elghadban@gmail.com

## License

ScreenCaptureDetector is available under the MIT license. See the LICENSE file for more info.

