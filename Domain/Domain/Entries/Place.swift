//
//  Place.swift
//  Domain
//
//  Created by ThuyenBV on 11/03/2022.
//

import Foundation

// MARK: - Place

public struct Place: Codable {
    public let location: Location?
    public let icon: String?
    public let id, name: String?
    public let photos: Photos?
    public let placeID: String?
    public let rating: Double?
    public let vicinity: String?

    enum CodingKeys: String, CodingKey {
        case location
        case icon
        case id
        case name
        case photos
        case placeID = "place_id"
        case rating, vicinity
    }

    public init(location: Location?, icon: String?, id: String?, name: String?, photos: Photos?, placeID: String?, rating: Double?, vicinity: String?) {
        self.location = location
        self.icon = icon
        self.id = id
        self.name = name
        self.photos = photos
        self.placeID = placeID
        self.rating = rating
        self.vicinity = vicinity
    }
}
