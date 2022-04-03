//
//  Application.swift
//  Application
//
//  Created by ThuyenBV on 16/03/2022.
//

import Domain
import Foundation
import UIKit
import Platform

// MARK: - Application

final class Application: NSObject {
    static let shared = Application()

    let networkProvider: ServiceAPI
    let navigator: Navigator
    
    override init() {
        navigator = Navigator.default
        networkProvider = NetworkProvider()
        
        super.init()
    }
}

extension Application {
    func presentRootScreen(in window: UIWindow?) {
        guard let window = window else { return }
        let homeTabViewModel = HomeTabViewModel(networkProvider: networkProvider)
        navigator.show(segue: .tabs(viewModel: homeTabViewModel), sender: nil, transition: .root(in: window))
    }
}
