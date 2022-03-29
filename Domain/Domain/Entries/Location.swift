//
//  Location.swift
//  Domain
//
//  Created by ThuyenBV on 11/03/2022.
//

import Foundation

// MARK: - Location
public struct Location: Codable {
    public let lat, lng: Double?

    public init(lat: Double?, lng: Double?) {
        self.lat = lat
        self.lng = lng
    }
}
