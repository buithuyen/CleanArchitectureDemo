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

    override public func viewDidLoad() {
        super.viewDidLoad()

        buildLayout()
        bindViewModel()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateLayout()
    }

    // MARK: - Function

    func buildLayout() {}

    func updateLayout() {}

    func bindViewModel() {}
}
