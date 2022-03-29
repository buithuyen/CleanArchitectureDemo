//
//  NetworkReachability.swift
//  Platform
//
//  Created by ThuyenBV on 21/03/2022.
//

import Alamofire
import Foundation
import RxSwift

public class NetworkReachability {
    static let shared = NetworkReachability()

    let reachSubject = ReplaySubject<Bool>.create(bufferSize: 1)
    var reachObservable: Observable<Bool> {
        return reachSubject.asObservable()
    }

    public init() {
        NetworkReachabilityManager.default?.startListening(onUpdatePerforming: { [weak self] status in
            switch status {
            case .notReachable,
                 .unknown:
                self?.reachSubject.onNext(false)
            case .reachable:
                self?.reachSubject.onNext(true)
            }
        })
    }
}
