//
//  HomeTabViewModel.swift
//  Application
//
//  Created by ThuyenBV on 31/03/2022.
//

import Foundation

class HomeTabViewModel: ViewModel {

    func viewModel(for tabBarItem: HomeTabItem) -> ViewModel {
        return PlaceListViewModel(networkProvider: networkProvider)
    }
}
