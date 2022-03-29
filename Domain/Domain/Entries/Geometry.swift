//
//  Geometry.swift
//  Domain
//
//  Created by ThuyenBV on 22/03/2022.
//

import Foundation

// MARK: - Geometry

public struct Geometry: Codable {
    public let location: Location?

    public init(location: Location?) {
        self.location = location
    }
}
