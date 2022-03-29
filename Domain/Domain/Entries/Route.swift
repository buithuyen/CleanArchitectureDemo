//
//  Route.swift
//  Domain
//
//  Created by ThuyenBV on 17/03/2022.
//

import Foundation

// MARK: - Route

public struct Route: Codable {
    public let overviewPolyline: OverviewPolyline?

    enum CodingKeys: String, CodingKey {
        case overviewPolyline = "overview_polyline"
    }

    public init(overviewPolyline: OverviewPolyline?) {
        self.overviewPolyline = overviewPolyline
    }
}

// MARK: - OverviewPolyline

public struct OverviewPolyline: Codable {
    public let points: String?

    public init(points: String?) {
        self.points = points
    }
}
