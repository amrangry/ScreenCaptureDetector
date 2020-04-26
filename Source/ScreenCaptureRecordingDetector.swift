//
//  ScreenCaptureRecordingDetector.swift
//  ADKATech.com
//
//  Created by AmrAngry on 4/23/20.
//  Copyright © 2020 ADKA Tech. All rights reserved.
//

import UIKit

/// ScreenCaptureRecordingDetector Class
/// reponsible for start and end monitoring for screencapture
public class ScreenCaptureRecordingDetector {
    
    /// default instance for handling the Capture screen
    // public static let `default` = ScreenCaptureRecordingDetector()
    //  open class var `default`: ScreenCaptureRecordingDetector { get }
    
    var delegate: ScreenCaptureDelegate? //swiftlint:disable:this weak_delegate
    internal var gameTimer: Timer?
    internal var stop: Bool?
    internal let screen: UIScreen = UIScreen.main
    private var screenshotNotification: NSObjectProtocol?
    
    /// True if this screen is being captured (e.g. recorded, AirPlayed, mirrored, etc.)
    /// False if mirroring is disabled or unsupported
    /// Readonly properity
    open var isCaptured: Bool {
        return isCapture()
    }
    
    deinit {
        purgeDependancies()
    }
    
    private init() {
        screenshotNotification = NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: OperationQueue.main) { [weak self] notification in
            
            guard let `self` = self else {
                return
            }
            #if DEBUG
            print("Post \(notification.name)")
            #endif
            self.delegate?.didTakeScreenshot()
        }
        
    }
    
    convenience init(delegate: ScreenCaptureDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    /// Create instnace that has default implementation
    /// @return ScreenCaptureRecordingDetector
    static func createDafaultInstnace() -> ScreenCaptureRecordingDetector {
        let handler = ScreenCaptureDelegateDefaultImpl.default
        let instance = ScreenCaptureRecordingDetector(delegate: handler)
        return instance
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
        purgeDependancies()
    }
    
    @objc internal func runTimedCode() {
        if stop ?? false {
            gameTimer?.invalidate()
        }
    }
    
    private func checkForScreenCapture() {
        let isCaptured = isCapture()
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
    
    private func isCapture() -> Bool {
        var isCaptured: Bool = false
        if #available(iOS 11.0, *) {
            isCaptured = screen.isCaptured //screen capture is active
        } else {
            // Fallback on earlier versions
            isCaptured = (screen.mirrored != nil) ? true:false // mirroring is active
        }
        
        return isCaptured
    }
    
    func purgeDependancies() {
       // NotificationCenter.default.removeObserver(screenshotNotification as Any, name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        NotificationCenter.default.removeObserver(screenshotNotification as Any)
        gameTimer?.invalidate()
    }
    
    //    - (BOOL)isRecording {
    //    for (UIScreen *screen in UIScreen.screens) {
    //    if ([screen respondsToSelector:@selector(isCaptured)]) {
    //    // iOS 11+ has isCaptured method.
    //    if ([screen performSelector:@selector(isCaptured)]) {
    //    return YES; // screen capture is active
    //    } else if (screen.mirroredScreen) {
    //    return YES; // mirroring is active
    //    }
    //    } else {
    //    // iOS version below 11.0
    //    if (screen.mirroredScreen)
    //    return YES;
    //    }
    //    }
    //    return NO;
    //    }
    
}

