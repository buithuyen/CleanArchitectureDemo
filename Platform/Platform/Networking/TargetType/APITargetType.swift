//
//  GoogleTargetType.swift
//  Platform
//
//  Created by ThuyenBV on 21/03/2022.
//

import Domain
import Foundation
import Moya

public enum APITargetType {
    case nearbyPlace
    case placeDetail(placeID: String)
}

extension APITargetType: TargetType {
    public var baseURL: URL {
        return URL(string: NetworkConfigs.Parse.baseURL)!
    }

    public var path: String {
        switch self {
       
        case .nearbyPlace:
            return "Restaurant"
        case .placeDetail(placeID: _):
            return ""
        }
    }

    public var method: Moya.Method {
        return Method.get
    }

    var parameters: [String: Any]? {
        return nil
    }

    public var task: Task {
        if let parameters = parameters {
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
        return .requestPlain
    }

    public var headers: [String: String]? {
        return ["accept":"application/json",
                "X-Parse-Application-Id": NetworkConfigs.Parse.applicationID,
                "X-Parse-REST-API-Key": NetworkConfigs.Parse.restAPIKey]
    }
}
