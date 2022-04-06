//
//  NodeController.swift
//  Application
//
//  Created by ThuyenBV on 31/03/2022.
//

import AsyncDisplayKit
import UIKit

class NodeController: ASNodeController<ASDisplayNode>, Navigable {
    var viewModel: ViewModel?
    var navigator: Navigator?

    init(viewModel: ViewModel?, navigator: Navigator?) {
        self.viewModel = viewModel
        self.navigator = navigator

        super.init()
    }
}
