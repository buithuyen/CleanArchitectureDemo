//
//  PlaceDetail.swift
//  Domain
//
//  Created by Bùi Văn Thuyên on 08/04/2022.
//

import Foundation

// MARK: - PlaceDetail
public struct PlaceDetail: Codable {
    public let formattedAddress: String?
    public let formattedPhoneNumber: String?
    public let geometry: Geometry?
    public let internationalPhoneNumber: String?
    public let name: String?
    public let photos: [Photo]?
    public let placeID: String?
    public let priceLevel: Int?
    public let rating: Double?
    public let reference: String?
    public let reviews: [Review]?
    public let url: String?
    public let userRatingsTotal: Int?
    public let vicinity: String?
    public let website: String?

    enum CodingKeys: String, CodingKey {
        case formattedAddress = "formatted_address"
        case formattedPhoneNumber = "formatted_phone_number"
        case geometry = "geometry"
        case internationalPhoneNumber = "international_phone_number"
        case name = "name"
        case photos = "photos"
        case placeID = "place_id"
        case priceLevel = "price_level"
        case rating = "rating"
        case reference = "reference"
        case reviews = "reviews"
        case url = "url"
        case userRatingsTotal = "user_ratings_total"
        case vicinity = "vicinity"
        case website = "website"
    }

    public init(formattedAddress: String?, formattedPhoneNumber: String?, geometry: Geometry?, internationalPhoneNumber: String?, name: String?, photos: [Photo]?, placeID: String?, priceLevel: Int?, rating: Double?, reference: String?, reviews: [Review]?, url: String?, userRatingsTotal: Int?, vicinity: String?, website: String?) {
        self.formattedAddress = formattedAddress
        self.formattedPhoneNumber = formattedPhoneNumber
        self.geometry = geometry
        self.internationalPhoneNumber = internationalPhoneNumber
        self.name = name
        self.photos = photos
        self.placeID = placeID
        self.priceLevel = priceLevel
        self.rating = rating
        self.reference = reference
        self.reviews = reviews
        self.url = url
        self.userRatingsTotal = userRatingsTotal
        self.vicinity = vicinity
        self.website = website
    }
}

// MARK: - Geometry
public struct Geometry: Codable {
    public let location: Location?

    enum CodingKeys: String, CodingKey {
        case location = "location"
    }

    public init(location: Location?) {
        self.location = location
    }
}
