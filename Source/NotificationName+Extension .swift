//
//  NotificationName+Extension .swift
//  ADKATech.com
//
//  Created by AmrAngry on 4/25/20.
//  Copyright © 2020 ADKA Tech. All rights reserved.
//

import Foundation

public extension Notification.Name {
    /// This notification is posted after the user start recording screen or mirror application screen
    static let screenCapturingStarted = Notification.Name(rawValue: "screenCapturingStarted")
    /// This notification is posted after the user end recording screen or mirror application screen
    static let screenCapturingEnded = Notification.Name(rawValue: "screenCapturingEnded")
}
