//
//  ViewController.swift
//  Common
//
//  Created by ThuyenBV on 15/03/2022.
//

import SnapKit
import UIKit

// MARK: - ViewController

public class ViewController: UIViewController, Navigable {
    var viewModel: ViewModel?
    var navigator: Navigator?

    lazy var stackView: StackView = {
        let subviews: [UIView] = []
        let stackView = StackView(arrangedSubviews: subviews)

        view.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return stackView
    }()

    init(viewModel: ViewModel?, navigator: Navigator?) {
        self.viewModel = viewModel
        self.navigator = navigator

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }

    func buildLayout() {}

    func updateLayout() {}

    func bindViewModel() {}
}
