//
//  Application.swift
//  Application
//
//  Created by ThuyenBV on 16/03/2022.
//

import Domain
import Foundation
import Platform
import UIKit

// MARK: - Application

final class Application: NSObject {
    static let shared = Application()

    let networkProvider: ServiceAPI
    let navigator: Navigator

    override init() {
        navigator = Navigator.default
        networkProvider = NetworkProvider()

        super.init()
        setUpAppearance()
    }
}

extension Application {
    func presentRootScreen(in window: UIWindow?) {
        let window = window ?? UIWindow(frame: UIScreen.main.bounds)
        let homeTabViewModel = HomeTabViewModel(networkProvider: networkProvider)
        navigator.show(segue: .tabs(viewModel: homeTabViewModel), sender: nil, transition: .root(with: window))
    }
}

extension Application {
    private func setUpAppearance() {
        UITabBar.appearance().barTintColor = UIColor.background()
        UITabBar.appearance().tintColor = UIColor.main()
        UITabBar.appearance().isTranslucent = false

        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.main()
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.main(),
                                                            NSAttributedString.Key.font: UIFont.title()]

        UIBarButtonItem.appearance().tintColor = UIColor.main()
    }
}
