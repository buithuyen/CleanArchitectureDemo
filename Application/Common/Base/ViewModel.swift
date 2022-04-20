//
//  ViewModel.swift
//  Application
//
//  Created by ThuyenBV on 15/03/2022.
//

import Domain
import Foundation

class ViewModel: NSObject {
    let networkProvider: ServiceAPI
    
    let loading = LoadingTracker()
    let refreshLoading = LoadingTracker()
    let loadmoreLoading = LoadingTracker()

    init(networkProvider: ServiceAPI) {
        self.networkProvider = networkProvider
        super.init()
    }
}
