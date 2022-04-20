//
//  NetworkConfigs.swift
//  Platform
//
//  Created by ThuyenBV on 21/03/2022.
//

import Foundation

struct NetworkConfigs {
    struct Google {
        static let baseURL = "https://maps.googleapis.com/maps/api/"
        static let photoURL = "https://maps.googleapis.com/maps/api/place/photo"
        static let key = "AIzaSyAxdz4-JfihFHsU-wFs8pLuU0jNfnudefU"
        static let type = "restaurant"
    }
    
    struct Parse {
        static let baseURL = "https://parseapi.back4app.com/classes/"
        static let applicationID = "slS93XEXLQP3jzHqgNmYqWjIJM6RsglP6dg06ujX"
        static let restAPIKey = "2Y7OJl2Bx80KLdKfEUmTCVQqR4Onbr3hkgF83JVg"
    }
}
