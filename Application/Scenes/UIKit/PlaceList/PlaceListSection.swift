//
//  PlaceListSection.swift
//  Application
//
//  Created by Bùi Văn Thuyên on 06/04/2022.
//

import Domain
import Foundation
import RxDataSources

struct PlaceListSection {
    var items: [Item]
}

extension PlaceListSection: SectionModelType {
    typealias Item = Place

    init(original: PlaceListSection, items: [Place]) {
        self = original
        self.items = items
    }
}
