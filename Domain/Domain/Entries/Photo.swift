//
//  Photo.swift
//  Domain
//
//  Created by ThuyenBV on 11/03/2022.
//

import Foundation

// MARK: - Photos
public struct Photos: Codable {
    public let height: Int?
    public let photoReference: String?
    public let width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case photoReference = "photo_reference"
        case width
    }

    public init(height: Int?, photoReference: String?, width: Int?) {
        self.height = height
        self.photoReference = photoReference
        self.width = width
    }
}
