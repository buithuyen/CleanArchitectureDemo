//
//  PlaceListViewModel.swift
//  Application
//
//  Created by ThuyenBV on 31/03/2022.
//

import Domain
import Foundation
import RxCocoa
import RxSwift

class PlaceListViewModel: ViewModel, ViewModelType {
    struct Input {
        let refresh: Observable<Void>
    }

    struct Output {
        let items: BehaviorRelay<[PlaceListSection]>
    }

    func handle(input: Input) -> Output {
        let items = BehaviorRelay<[PlaceListSection]>(value: [])
        input.refresh.flatMapLatest { () in
            return self.networkProvider.getNearbyPlaces()
        }.subscribe { places in
            items.accept([PlaceListSection(items: places)])
        }.disposed(by: rx.disposeBag)
        
        return Output(items: items)
    }
}
