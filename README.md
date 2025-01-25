
<p align="center">
  <img src ="https://github.com/amrangry/ScreenCaptureDetector/blob/master/Example/ScreenCaptureDetector/Images.xcassets/icon.imageset/icon.png?raw=true"/>
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

![Alt text](https://github.com/amrangry/ScreenCaptureDetector/blob/master/Example/ScreenCaptureDetector/Images.xcassets/screendetector.dataset/screendetector.gif?raw=true "Screen Player")


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

Simply import ScreenCaptureDetector in AppDelegate:
import ScreenCaptureDetector

Add the following to AppDelegate's didFinishLaunchingWithOptions:
```ruby
///How to use using default instance
let monitor = ScreenCaptureRecordingDetector.createDafaultInstnace()
monitor.startMonitor()
```
Or "Recommended"
```ruby

1- conform protocol ScreenCaptureDelegate that has 3 optional func :
       func didStartCapture()
       func didEndCapture()
       func didTakeScreenshot()
       
2- passing the conformed class to the init method of ScreenCaptureRecordingDetector
3- calling method startMonitor() to start
4- calling method endMonitor()  to stop 
  
``` 
Or
```ruby
        ///How to use using NotificationCenter
        let monitor = ScreenCaptureRecordingDetector()
        monitor.delegate = nil
        monitor.startMonitor()
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen), name: .screenCapturingStarted, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(dimissScreen), name: .screenCapturingEnded, object: nil)
       
```   
Or
```ruby
        ///How to use using Custom view
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let overWindow = appDelegate?.window
        let customView = UIView.init(frame: overWindow?.bounds ?? CGRect.init(x: 0, y: 0, width: 200, height: 200))
        customView.backgroundColor = .yellow
        
        let screenCaptureDelegate = ScreenCaptureDelegateDefaultImpl(suspendView: customView, drawOver: overWindow)
        let monitor = ScreenCaptureRecordingDetector(delegate: screenCaptureDelegate)
        monitor.startMonitor()
``` 
## Environment
---
```ruby
Xcode Version 11.3.1
```
```ruby
Swift 5.0
```

## Author
AmrAngry, <a href="amr.elghadban@gmail.com">amr.elghadban@gmail.com</a>  [Send](mailto:amr.elghadban@gmail.com?subject=I%20checked%20your%20github%20repo!)
[![Twitter Follow](https://img.shields.io/twitter/follow/amr_elghadban?style=social)](https://twitter.com/intent/follow?screen_name=amr_elghadban)

[![Linkedin](https://img.shields.io/badge/Lets%20Connect%20via-LinkedIn-blue)](https://www.linkedin.com/in/amrelghadban/)

WebSite: [https://amrangry.github.io/](https://amrangry.github.io/)

## Contributing 🤘
All your feedback and help to improve this project is very welcome. Please create issues for your bugs, ideas and enhancement requests, or better yet, contribute directly by creating a PR. 😎

When reporting an issue, please add a detailed instruction, and if possible a code snippet or test that can be used as a reproducer of your problem. 💥

When creating a pull request, please adhere to the current coding style where possible, and create tests with your code so it keeps providing an awesome test coverage level 💪

## License
<details>
<summary>MIT License.</summary>
Distributed under MIT License.
Copyright 2025 Amr Elghadban
</details>

