//
//  PlaceDetail.swift
//  Domain
//
//  Created by ThuyenBV on 22/03/2022.
//

import Foundation

// MARK: - PlaceDetail

public struct PlaceDetail: Codable {
    public let businessStatus, formattedAddress, formattedPhoneNumber: String?
    public let geometry: Geometry?
    public let icon: String?
    public let iconBackgroundColor, internationalPhoneNumber, name, placeID: String?
    public let rating: Double?
    public let reference: String?
    public let reviews: [Review]?
    public let types: [String]?
    public let url: String?
    public let userRatingsTotal, utcOffset: Int?
    public let vicinity: String?
    public let website: String?

    enum CodingKeys: String, CodingKey {
        case businessStatus = "business_status"
        case formattedAddress = "formatted_address"
        case formattedPhoneNumber = "formatted_phone_number"
        case geometry, icon
        case iconBackgroundColor = "icon_background_color"
        case internationalPhoneNumber = "international_phone_number"
        case name
        case placeID = "place_id"
        case rating, reference, reviews, types, url
        case userRatingsTotal = "user_ratings_total"
        case utcOffset = "utc_offset"
        case vicinity, website
    }

    public init(businessStatus: String?, formattedAddress: String?, formattedPhoneNumber: String?, geometry: Geometry?, icon: String?, iconBackgroundColor: String?, internationalPhoneNumber: String?, name: String?, placeID: String?, rating: Double?, reference: String?, reviews: [Review]?, types: [String]?, url: String?, userRatingsTotal: Int?, utcOffset: Int?, vicinity: String?, website: String?) {
        self.businessStatus = businessStatus
        self.formattedAddress = formattedAddress
        self.formattedPhoneNumber = formattedPhoneNumber
        self.geometry = geometry
        self.icon = icon
        self.iconBackgroundColor = iconBackgroundColor
        self.internationalPhoneNumber = internationalPhoneNumber
        self.name = name
        self.placeID = placeID
        self.rating = rating
        self.reference = reference
        self.reviews = reviews
        self.types = types
        self.url = url
        self.userRatingsTotal = userRatingsTotal
        self.utcOffset = utcOffset
        self.vicinity = vicinity
        self.website = website
    }
}
