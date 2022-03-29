//
//  GoogleTargetType.swift
//  Platform
//
//  Created by ThuyenBV on 21/03/2022.
//

import Domain
import Foundation
import Moya

public enum GoogleTargetType {
    case nearbySearch(location: String, radius: Int)
    case placeDetail(placeID: String)
    case direction(origin: String, destination: String)
}

extension GoogleTargetType: TargetType {
    public var baseURL: URL {
        return URL(string: NetworkConfigs.Google.baseURL)!
    }

    public var path: String {
        switch self {
        case .nearbySearch:
            return "place/nearbysearch/json"
        case .placeDetail:
            return "place/details/json"
        case .direction:
            return "directions/json"
        }
    }

    public var method: Moya.Method {
        return Method.get
    }

    var parameters: [String: Any]? {
        switch self {
        case let .nearbySearch(location, radius):
            return ["location": location,
                    "radius": radius,
                    "type": NetworkConfigs.Google.type,
                    "key": NetworkConfigs.Google.key]
        case let .placeDetail(placeID):
            return ["place_id": placeID,
                    "key": NetworkConfigs.Google.key]
        case let .direction(origin, destination):
            return ["origin": origin,
                    "destination": destination,
                    "key": NetworkConfigs.Google.key]
        }
    }

    public var task: Task {
        if let parameters = parameters {
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
        return .requestPlain
    }

    public var headers: [String: String]? {
        return nil
    }
}
