//
//  ScreenCaptureHandler.swift
//  Pods-ScreenCaptureDetector_Example
//
//  Created by AmrAngry on 4/25/20.
//

import Foundation
import UIKit

final class ScreenCaptureDelegateDefaultImpl: NSObject {
    
    static let `default` = ScreenCaptureDelegateDefaultImpl()
    
    var customView: UIView
    var window: UIWindow? {
        didSet {
            customView.frame = window?.bounds ?? CGRect.init(x: 0, y: 0, width: 200, height: 200)
        }
    }
    
    override init() {
        
        customView = UIView()
        customView.backgroundColor = .red
        
        //        if let applicationwindow = UIApplication.shared.delegate?.window {
        //            window = applicationwindow
        //        }
        if let applicationWindow = UIApplication.shared.windows.first {
            window = applicationWindow
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
        //let views = window?.subviews
        //print(views?.count ?? 0)
    }
}
