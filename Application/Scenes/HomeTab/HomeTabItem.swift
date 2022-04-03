//
//  HomeTabItem.swift
//  Application
//
//  Created by ThuyenBV on 31/03/2022.
//

import Foundation
import UIKit

enum HomeTabItem {
    case uikit, texture
    
    var image: UIImage? {
        return R.image.icon_button_star()
    }
    
    var selectedImage: UIImage? {
        return R.image.icon_button_unstar()
    }
    
    var title: String {
        switch self {
        case .uikit:
            return "UIKit"
        case .texture:
            return "AsyncDisplayKit"
        }
    }
    
    func getController(with viewModel: ViewModel?, navigator: Navigator?) -> UIViewController {
        let itemBar = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        let controller = controller(with: viewModel, navigator: navigator)
        controller.tabBarItem = itemBar
        
        return controller
    }
    
    private func controller(with viewModel: ViewModel?, navigator: Navigator?) -> UIViewController {
        switch self {
        case .uikit:
            let viewController = PlaceListViewController(viewModel: viewModel, navigator: navigator)
            viewController.view.backgroundColor = .red
            return NavigationController(rootViewController: viewController)
        case .texture:
            let nodeController = ViewController(viewModel: viewModel, navigator: navigator)
            nodeController.view.backgroundColor = .yellow
            return NavigationController(rootViewController: nodeController)
        }
    }
}
