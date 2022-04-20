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
        let placeSelection: Observable<Place>
    }

    struct Output {
        let items: BehaviorRelay<[PlaceListSection]>
        let placeSelected: Driver<PlaceDetailViewModel>
    }

    func handle(input: Input) -> Output {
        let items = BehaviorRelay<[PlaceListSection]>(value: [])
        input.refresh.flatMapLatest { () in
            self.networkProvider
                .getNearbyPlaces()
                .trackActivity(self.loading)
                .trackActivity(self.refreshLoading)
        }.subscribe { places in
            items.accept([PlaceListSection(items: places)])
        }.disposed(by: rx.disposeBag)

        let placeSected = input.placeSelection
            .compactMap { $0.placeID }
            .asDriver(onErrorJustReturn: nil)
            .compactMap { $0 }
            .map { placeID in
                PlaceDetailViewModel(placeID: placeID, networkProvider: self.networkProvider)
            }
        return Output(items: items,
                      placeSelected: placeSected)
    }
}
