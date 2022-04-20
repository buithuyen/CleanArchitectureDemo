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
        case placeList(PlaceListViewModel)
        case placeDetail(PlaceDetailViewModel)
    }

    enum Transition {
        case root(with: UIWindow)
        case navigation(type: HeroDefaultAnimationType? = nil)
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

    func show(segue: Scene,
              sender: UIViewController?,
              transition: Transition = .navigation(type: .cover(direction: .left))) {
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
        case let .viewController(viewModel):
            return ViewController(viewModel: viewModel, navigator: self)
        case let .tabs(viewModel):
            return HomeTabViewController(viewModel: viewModel, navigator: self)
        case let .placeList(viewModel):
            return PlaceListViewController(viewModel: viewModel, navigator: self)
        case let .placeDetail(viewModel):
            return PlaceDetailViewController(viewModel: viewModel, navigator: self)
        }
    }

    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        switch transition {
        case let .root(with: window):
            window.rootViewController = target
            window.makeKeyAndVisible()
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
                if let type = type {
                    nav.hero.navigationAnimationType = .autoReverse(presenting: type)
                }
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
