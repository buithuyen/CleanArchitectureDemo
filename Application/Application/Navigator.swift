//
//  Navigator.swift
//  Application
//
//  Created by ThuyenBV on 15/03/2022.
//

import Foundation
import Hero
import SafariServices
import UIKit

// MARK: - Navigator

class Navigator {
    static let `default` = Navigator()

    enum Scene {
        case tabs(viewModel: HomeTabViewModel)
        case safari(URL)
        case safariController(URL)
        case webController(URL)
        case viewController(ViewModel)
    }

    enum Transition {
        case root(in: UIWindow?)
        case navigation(type: HeroDefaultAnimationType)
        case customModal(type: HeroDefaultAnimationType)
        case modal
        case detail
        case alert
        case custom
    }

    func pop(sender: UIViewController?, toRoot: Bool = false) {
        if toRoot {
            sender?.navigationController?.popToRootViewController(animated: true)
        } else {
            sender?.navigationController?.popViewController(animated: true)
        }
    }

    func dismiss(sender: UIViewController?) {
        sender?.navigationController?.dismiss(animated: true, completion: nil)
    }

    func show(segue: Scene, sender: UIViewController?, transition: Transition = .navigation(type: .cover(direction: .left))) {
        if let target = get(segue: segue) {
            show(target: target, sender: sender, transition: transition)
        }
    }
}

extension Navigator {
    private func get(segue: Scene) -> UIViewController? {
        switch segue {
        case let .safari(url):
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return nil

        case let .safariController(url):
            return SFSafariViewController(url: url)

        case let .webController(url):
            let webview = WebViewController(viewModel: nil, navigator: self)
            webview.load(url: url)
            return webview

        case .viewController:
            return nil
        case let .tabs(viewModel):
            return HomeTabViewController(viewModel: viewModel, navigator: self)
        }
    }

    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        switch transition {
        case let .root(in: window):
            let window = window ?? UIWindow(frame: UIScreen.main.bounds)
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                window.rootViewController = target
                window.makeKeyAndVisible()
            }, completion: nil)
            return
        case .custom: return
        default: break
        }

        guard let sender = sender else {
            fatalError("You need to pass in a sender for .navigation or .modal transitions")
        }

        if let nav = sender as? UINavigationController {
            nav.pushViewController(target, animated: false)
            return
        }

        switch transition {
        case let .navigation(type):
            if let nav = sender.navigationController {
                nav.hero.navigationAnimationType = .autoReverse(presenting: type)
                nav.pushViewController(target, animated: true)
            }
        case let .customModal(type):
            let nav = NavigationController(rootViewController: target)
            nav.hero.modalAnimationType = .autoReverse(presenting: type)
            sender.present(nav, animated: true, completion: nil)
        case .modal:
            let nav = NavigationController(rootViewController: target)
            sender.present(nav, animated: true, completion: nil)
        case .detail:
            let nav = NavigationController(rootViewController: target)
            sender.showDetailViewController(nav, sender: nil)
        case .alert:
            sender.present(target, animated: true, completion: nil)
        default: break
        }
    }
}
