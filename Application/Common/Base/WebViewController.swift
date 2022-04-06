//
//  WebViewController.swift
//  Application
//
//  Created by ThuyenBV on 15/03/2022.
//

import RxCocoa
import RxSwift
import UIKit
import WebKit

// MARK: - WebViewController

class WebViewController: ViewController {
    let url = BehaviorRelay<URL?>(value: nil)

    lazy var rightBarButton: BarButtonItem = {
        let view = BarButtonItem(image: R.image.icon_navigation_web(), style: .done, target: nil, action: nil)
        return view
    }()

    lazy var goBackBarButton: BarButtonItem = {
        let view = BarButtonItem(image: R.image.icon_navigation_back(), style: .done, target: nil, action: nil)
        return view
    }()

    lazy var goForwardBarButton: BarButtonItem = {
        let view = BarButtonItem(image: R.image.icon_navigation_forward(), style: .done, target: nil, action: nil)
        return view
    }()

    lazy var stopReloadBarButton: BarButtonItem = {
        let view = BarButtonItem(image: R.image.icon_navigation_refresh(), style: .done, target: nil, action: nil)
        return view
    }()

    lazy var webView: WKWebView = {
        let view = WKWebView()
        view.navigationDelegate = self
        view.uiDelegate = self
        return view
    }()

    lazy var toolbar: Toolbar = {
        let view = Toolbar()
        view.items = [self.goBackBarButton,
                      self.goForwardBarButton,
                      spaceBarButton,
                      self.stopReloadBarButton]
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func buildLayout() {
        super.buildLayout()

        navigationItem.rightBarButtonItem = rightBarButton
        stackView.insertArrangedSubview(webView, at: 0)
        stackView.addArrangedSubview(toolbar)
    }

    override func updateLayout() {
        super.updateLayout()

        goBackBarButton.isEnabled = webView.canGoBack
        goForwardBarButton.isEnabled = webView.canGoForward
        stopReloadBarButton.image = webView.isLoading ?
        R.image.icon_navigation_stop() : R.image.icon_navigation_refresh()
    }

    func load(url: URL) {
        self.url.accept(url)
        webView.load(URLRequest(url: url))
    }
}

// MARK: WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit _: WKNavigation!) {
        url.accept(webView.url)
        updateLayout()
    }

    func webView(_: WKWebView, didFinish _: WKNavigation!) {
        updateLayout()
    }

    func webView(_: WKWebView, didFail _: WKNavigation!, withError _: Error) {
        updateLayout()
    }
}

// MARK: WKUIDelegate

extension WebViewController: WKUIDelegate {}
