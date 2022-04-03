//
//  ServiceAPI.swift
//  Domain
//
//  Created by ThuyenBV on 22/03/2022.
//

import CoreLocation
import Foundation
import RxSwift

public protocol ServiceAPI {
    func getNearbyPlaces() -> Single<[Place]>
    func getPlaceDetail(placeID: String) -> Single<PlaceDetail>
}
