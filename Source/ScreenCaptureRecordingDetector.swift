//
//  ScreenCaptureRecordingDetector.swift
//  MotoShop
//
//  Created by AmrAngry on 4/23/20.
//  Copyright © 2020 ADKA Tech. All rights reserved.
//

import UIKit

public extension Notification.Name {
    static let screenCapturingStarted = Notification.Name(rawValue: "screenCapturingStarted")
    static let screenCapturingEnded = Notification.Name(rawValue: "screenCapturingEnded")
}

public class ScreenCaptureRecordingDetector {
    
    public static let shared = ScreenCaptureRecordingDetector()
    
    var gameTimer: Timer?
    var screen: UIScreen
    var imageview: UIImageView {
        let view = UIImageView(image: UIImage(named: "check_icon"))
        return view
    }
    
    private init() {
        screen  = UIScreen.main
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    
    @objc func runTimedCode() {
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
        } else {
            NotificationCenter.default.post(name: .screenCapturingEnded, object: isCaptured)
        }
    }
    
//    func monitor() {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            let randomNumber = Int.random(in: 1...20)
//            print("Number: \(randomNumber)")
//
//            if randomNumber == 10 {
//                timer.invalidate()
//            }
//        }
//    }
}
