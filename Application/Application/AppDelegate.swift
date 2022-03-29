//
//  AppDelegate.swift
//  Application
//
//  Created by ThuyenBV on 11/03/2022.
//

import Moya
import Platform
import UIKit
import AlamofireNetworkActivityLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    static var shared: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()

        Application.shared.presentRootScreen(in: window)

        return true
    }
}
