//
//  NotificationName+Extension .swift
//  MotoShop
//
//  Created by AmrAngry on 4/25/20.
//  Copyright © 2020 ADKA Tech. All rights reserved.
//

import Foundation

public extension Notification.Name {
    /// notificatio.naem screenCapturingStarted
    static let screenCapturingStarted = Notification.Name(rawValue: "screenCapturingStarted")
    /// notificatio.naem screenCapturingEnded
    static let screenCapturingEnded = Notification.Name(rawValue: "screenCapturingEnded")
}
