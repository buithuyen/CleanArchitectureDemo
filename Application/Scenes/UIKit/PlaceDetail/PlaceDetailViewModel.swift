//
//  PlaceDetailViewModel.swift
//  Application
//
//  Created by Bùi Văn Thuyên on 08/04/2022.
//

import Domain
import UIKit

class PlaceDetailViewModel: ViewModel {
    let placeID: String

    init(placeID: String, networkProvider: ServiceAPI) {
        self.placeID = placeID
        super.init(networkProvider: networkProvider)
    }
}
