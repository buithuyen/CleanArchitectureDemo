//
//  NetworkProvider.swift
//  Platform
//
//  Created by ThuyenBV on 21/03/2022.
//

import Domain
import Foundation
import Moya
import RxSwift

// MARK: - NetworkProvider

public class NetworkProvider {
    fileprivate let online: Observable<Bool>
    fileprivate let provider: MoyaProvider<MultiTarget>

    public init(plugins: [PluginType] = []) {
        online = NetworkReachability.shared.reachObservable
        provider = MoyaProvider(plugins: plugins)
    }

    func request(_ target: TargetType) -> Single<Moya.Response> {
        let request = provider.rx.request(MultiTarget(target))
        return online
            .filter { $0 == true }
            .take(1)
            .debug()
            .flatMap { _ in
                request.filterSuccessfulStatusCodes()
            }
            .asSingle()
    }
}

// MARK: GoogleService

extension NetworkProvider: GoogleService {
    public func getPlaceDetail(placeID: String) -> Single<PlaceDetail> {
        return request(GoogleTargetType.placeDetail(placeID: placeID))
            .map(PlaceDetail.self, atKeyPath: "result", using: JSONDecoder(), failsOnEmptyData: true)
    }
}
