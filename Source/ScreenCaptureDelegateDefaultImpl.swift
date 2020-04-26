//
//  ScreenCaptureHandler.swift
//  ADKATech.com
//
//  Created by AmrAngry on 4/25/20.
//  Copyright © 2020 ADKA Tech. All rights reserved.
//


import Foundation
import UIKit

final class ScreenCaptureDelegateDefaultImpl: NSObject {
    
    static let `default` = ScreenCaptureDelegateDefaultImpl()
    
    var customView: UIView
    var window: UIWindow? {
        didSet {
            customView.frame = window?.bounds ?? CGRect.init(x: 0, y: 0, width: 200, height: 200)
            customView.layoutIfNeeded()
        }
    }
    
    override init() {
        
        customView = UIView()
        customView.backgroundColor = .red
        
        if let applicationWindow = UIApplication.shared.windows.first {
            window = applicationWindow
            customView.frame = window?.bounds ?? CGRect.init(x: 0, y: 0, width: 200, height: 200)
            customView.layoutIfNeeded()
        }
        
        super.init()
    }
    
    convenience init(suspendView view: UIView) {
        self.init()
        customView = view
    }
    
    convenience init(suspendView view: UIView, drawOver: UIView?) {
        self.init()
        customView = view
        window = drawOver as? UIWindow
    }
    
}

extension ScreenCaptureDelegateDefaultImpl: ScreenCaptureDelegate {
    func didStartCapture() {
        let views = window?.subviews
        
        if views?.contains(customView) ?? false {
            window?.bringSubviewToFront(customView)
        } else {
            window?.addSubview(customView)
        }
        //self.window?.addSubview(ScreenCaptureRecordingDetector.shared.imageview)
    }
    
    func didEndCapture() {
        customView.removeFromSuperview()
    }
}

