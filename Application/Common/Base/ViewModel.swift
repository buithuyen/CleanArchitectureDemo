//
//  ViewModel.swift
//  Application
//
//  Created by ThuyenBV on 15/03/2022.
//

import Domain
import Foundation

class ViewModel: NSObject {
    let networkProvider: GoogleService

    init(networkProvider: GoogleService) {
        self.networkProvider = networkProvider
        super.init()
    }
}
