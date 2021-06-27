//
//  DengageNotificationViewController.swift
//  DengageContentExtension
//
//  Created by Nahit Rustu Heper on 27.06.2021.
//

import UserNotifications
import UserNotificationsUI
import Dengage_Framework

final class DengageNotificationViewController: UIViewController, UNNotificationContentExtension {

    let carouselView = DengageNotificationCarouselView.create()

    func didReceive(_ notification: UNNotification) {
        carouselView.didReceive(notification)
    }
    func didReceive(_ response: UNNotificationResponse,
                    completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        carouselView.didReceive(response, completionHandler: completion)
    }
    override func loadView() {
        self.view = carouselView
    }
}
