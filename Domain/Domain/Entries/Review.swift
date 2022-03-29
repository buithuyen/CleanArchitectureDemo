//
//  Review.swift
//  Domain
//
//  Created by ThuyenBV on 22/03/2022.
//

import Foundation

// MARK: - Review

public struct Review: Codable {
    public let authorName: String?
    public let authorURL: String?
    public let language: String?
    public let profilePhotoURL: String?
    public let rating: Int?
    public let relativeTimeDescription, text: String?
    public let time: Int?

    enum CodingKeys: String, CodingKey {
        case authorName = "author_name"
        case authorURL = "author_url"
        case language
        case profilePhotoURL = "profile_photo_url"
        case rating
        case relativeTimeDescription = "relative_time_description"
        case text, time
    }

    public init(authorName: String?, authorURL: String?, language: String?, profilePhotoURL: String?, rating: Int?, relativeTimeDescription: String?, text: String?, time: Int?) {
        self.authorName = authorName
        self.authorURL = authorURL
        self.language = language
        self.profilePhotoURL = profilePhotoURL
        self.rating = rating
        self.relativeTimeDescription = relativeTimeDescription
        self.text = text
        self.time = time
    }
}
