//
//  NetworkUtilities.swift
//  Platform
//
//  Created by Bùi Văn Thuyên on 05/04/2022.
//

import Foundation

public func genGooglePhoto(reference: String?, maxWidth: Int? = nil, maxHeight: Int? = nil) -> URL? {
    var urlComponents = URLComponents(string: NetworkConfigs.Google.photoURL)
    var items: [URLQueryItem] = [URLQueryItem(name: "photo_reference", value: reference),
                                 URLQueryItem(name: "key", value: NetworkConfigs.Google.key)]

    if let maxWidth = maxWidth {
        items.append(URLQueryItem(name: "maxwidth", value: String(maxWidth)))
    }

    if let maxHeight = maxHeight {
        items.append(URLQueryItem(name: "maxheight", value: String(maxHeight)))
    }

    urlComponents?.queryItems = items
    return urlComponents?.url
}
