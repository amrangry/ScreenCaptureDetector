//
//  AppDelegate.swift
//  ScreenCaptureDetector
//
//  Created by amrangry on 04/23/2020.
//  Copyright (c) 2020 amrangry. All rights reserved.
//

import UIKit
import ScreenCaptureDetector

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var view: UIView = UIView()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
         /*
         ///How to use using NotificationCenter
         let monitor = ScreenCaptureRecordingDetector()
         monitor.delegate = nil
         monitor.startMonitor()
         NotificationCenter.default.addObserver(self, selector: #selector(showScreen), name: .screenCapturingStarted, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(dimissScreen), name: .screenCapturingEnded, object: nil)
         */
        
         /*
         ///How to use using Custom view
         let appDelegate = UIApplication.shared.delegate as? AppDelegate
         let overWindow = appDelegate?.window
         let customView = UIView.init(frame: overWindow?.bounds ?? CGRect.init(x: 0, y: 0, width: 200, height: 200))
         customView.backgroundColor = .yellow
         
         let screenCaptureDelegate = ScreenCaptureDelegateDefaultImpl.init(suspendView: customView, drawOver: overWindow)
         let monitor = ScreenCaptureRecordingDetector(delegate: screenCaptureDelegate)
         monitor.startMonitor()
         */
        
        ///How to use using default instance
        let monitor = ScreenCaptureRecordingDetector.default
        monitor.startMonitor()
        return true
    }
    
    @objc func showScreen() {
        view.frame = window?.bounds ?? CGRect.init(x: 0, y: 0, width: 200, height: 200)
        view.backgroundColor = .blue
        
        let views = window?.subviews
        
        if views?.contains(view) ?? false {
            window?.bringSubviewToFront(view)
        } else {
            window?.addSubview(view)
        }
        
    }
    
    @objc func dimissScreen() {
        view.removeFromSuperview()
        let views = window?.subviews
        print(views?.count ?? 0)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


