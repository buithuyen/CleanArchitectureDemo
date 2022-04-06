//
//  Place.swift
//  Domain
//
//  Created by ThuyenBV on 11/03/2022.
//

import Foundation

// MARK: - Place

public struct Place: Codable {
    public let objectID: String?
    public let location: Location?
    public let name: String?
    public let photos: [Photo]?
    public let placeID: String?
    public let priceLevel: Int?
    public let rating: Double?
    public let reference: String?
    public let userRatingsTotal: Int?
    public let vicinity, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case objectID = "objectId"
        case location, name, photos
        case placeID = "place_id"
        case priceLevel = "price_level"
        case rating, reference
        case userRatingsTotal = "user_ratings_total"
        case vicinity, createdAt, updatedAt
    }

    public init(objectID: String?, location: Location?, name: String?, photos: [Photo]?, placeID: String?, priceLevel: Int?, rating: Double?, reference: String?, userRatingsTotal: Int?, vicinity: String?, createdAt: String?, updatedAt: String?) {
        self.objectID = objectID
        self.location = location
        self.name = name
        self.photos = photos
        self.placeID = placeID
        self.priceLevel = priceLevel
        self.rating = rating
        self.reference = reference
        self.userRatingsTotal = userRatingsTotal
        self.vicinity = vicinity
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
