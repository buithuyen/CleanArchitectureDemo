//
//  ViewController.swift
//  Application
//
//  Created by ThuyenBV on 11/03/2022.
//

import UIKit

public class ExampleViewController: ViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?
            .networkProvider
            .getPlaceDetail(placeID: "ChIJN1t_tDeuEmsRUsoyG83frY4")
            .subscribe(onSuccess: { placeDetail in
                print(placeDetail)
            }, onFailure: { error in
                print(error)
            }).disposed(by: rx.disposeBag)
    }
}
