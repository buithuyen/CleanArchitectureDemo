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
    // MARK: - Property
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

    // MARK: - Initialize
    init(viewModel: ViewModel?, navigator: Navigator?) {
        self.viewModel = viewModel
        self.navigator = navigator

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Life cycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        buildLayout()
        bindViewModel()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateLayout()
    }

    // MARK: - Function
    func buildLayout() {}

    func updateLayout() {}

    func bindViewModel() {}
}
