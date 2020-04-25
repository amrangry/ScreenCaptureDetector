//
//  ScreenCaptureDelegate.swift
//  ScreenCaptureDetector
//
//  Created by AmrAngry on 4/25/20.
//

import Foundation

//swiftlint:disable:next class_delegate_protocol
protocol ScreenCaptureDelegate: NSObject {
    func didStartCapture()
    func didEndCapture()
}
