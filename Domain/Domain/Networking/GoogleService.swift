//
//  GoogleService.swift
//  Domain
//
//  Created by ThuyenBV on 22/03/2022.
//

import CoreLocation
import Foundation
import RxSwift

public protocol GoogleService {
//    func getNearbyPlace(currentLocation: CLLocation) -> Single<[Place]>
    func getPlaceDetail(placeID: String) -> Single<PlaceDetail>
//    func sortPlaceLocationToShortestRoute(currentLocation: CLLocation, placeLocations: [Place]) -> Single<[Place]>
//    func getRoute(currentLocation: CLLocation, pharmacyLocations: [Place]) -> Single<[Route]>
}
