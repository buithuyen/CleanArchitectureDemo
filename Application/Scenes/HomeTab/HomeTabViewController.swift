//
//  HomeTabViewController.swift
//  Application
//
//  Created by ThuyenBV on 31/03/2022.
//

import UIKit

// MARK: - HomeTabViewController

class HomeTabViewController: UITabBarController, Navigable {
    var viewModel: HomeTabViewModel?
    var navigator: Navigator?

    init(viewModel: HomeTabViewModel?, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildLayout()
    }
}

extension HomeTabViewController {
    func buildLayout() {
        let controllers = [HomeTabItem.uikit, HomeTabItem.texture]
            .map({$0.getController(with: viewModel?.viewModel(for: $0), navigator: navigator)})
        setViewControllers(controllers, animated: true)

        tabBar.tintColor = .white
        tabBar.backgroundColor = .darkGray
    }
}
