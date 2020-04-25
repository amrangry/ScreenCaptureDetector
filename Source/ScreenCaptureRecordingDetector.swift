//
//  ScreenCaptureRecordingDetector.swift
//  MotoShop
//
//  Created by AmrAngry on 4/23/20.
//  Copyright © 2020 ADKA Tech. All rights reserved.
//

import UIKit

/// ScreenCaptureRecordingDetector Class
/// reponsible for start and end monitoring for screencapture
public class ScreenCaptureRecordingDetector {
    
    /// default instance for handling the Capture screen
    public static let `default` = ScreenCaptureRecordingDetector()
    
    var delegate: ScreenCaptureDelegate? //swiftlint:disable:this weak_delegate
    internal var gameTimer: Timer?
    internal var stop: Bool?
    internal let screen: UIScreen = UIScreen.main
    
    init() {
        //screen  = UIScreen.main
        let handler = ScreenCaptureDelegateDefaultImpl.default
        delegate = handler
    }
    
    convenience init(delegate: ScreenCaptureDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    /// start monitoring for screen capture
    open func startMonitor() {
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if self.stop ?? false {
                    timer.invalidate()
                }
                self.checkForScreenCapture()
            }
        } else {
            // Fallback on earlier versions
            if !(gameTimer?.isValid ?? false) {
                gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
                // gameTimer?.fire()
            }
        }
    }
    
     /// End monitoring for screen capture
    open func endMonitor() {
        stop = false
        gameTimer?.invalidate()
    }
    
    @objc internal func runTimedCode() {
        if stop ?? false {
            gameTimer?.invalidate()
        }
    }
    
    private func checkForScreenCapture() {
        var isCaptured: Bool = false
        if #available(iOS 11.0, *) {
            isCaptured = screen.isCaptured
        } else {
            // Fallback on earlier versions
            isCaptured = (screen.mirrored != nil) ? true:false
        }
        ///value that indicates whether the contents of the screen are being cloned to another destination.
        // let isMirrord = screen.mirrored ///property which detects if the screen is being mirrored by an external display.
        print(isCaptured)
        // print(isMirrord)
        // gameTimer?.invalidate()
        if isCaptured {
            NotificationCenter.default.post(name: .screenCapturingStarted, object: isCaptured)
            delegate?.didStartCapture()
        } else {
            NotificationCenter.default.post(name: .screenCapturingEnded, object: isCaptured)
            delegate?.didEndCapture()
        }
    }
}
