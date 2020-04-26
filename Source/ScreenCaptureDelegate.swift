//
//  ScreenCaptureDelegate.swift
//  ADKATech.com
//
//  Created by AmrAngry on 4/25/20.
//  Copyright © 2020 ADKA Tech. All rights reserved.
//

import Foundation

//swiftlint:disable:next class_delegate_protocol
protocol ScreenCaptureDelegate: NSObject {
    func didStartCapture()
    func didEndCapture()
    func didTakeScreenshot()
}

extension ScreenCaptureDelegate {
    
    func didStartCapture() {
        #if DEBUG
        print("extension defualt implement didStartCapture")
        #endif
    }
    
    func didEndCapture() {
        #if DEBUG
        print("extension defualt implement didEndCapture")
        #endif
    }
    
    func didTakeScreenshot() {
        #if DEBUG
        print("extension defualt implement didTakeScreenshot")
        #endif
    }
    
}
