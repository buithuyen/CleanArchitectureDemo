//
//  UNUserNotificationCenter++.swift
//  Common
//
//  Created by ThuyenBV on 11/03/2022.
//

import Foundation
import UserNotifications
import CoreLocation

extension UNUserNotificationCenter {
    static func scheduleNotification(region: CLRegion, title: String, message: String) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, _ in
            guard granted == true else { return }

            let content = UNMutableNotificationContent()
            content.title = title
            content.body = message
            content.sound = UNNotificationSound.default
            content.categoryIdentifier = region.identifier

            let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
            let request = UNNotificationRequest(identifier: region.identifier, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request)
        }
    }
}
