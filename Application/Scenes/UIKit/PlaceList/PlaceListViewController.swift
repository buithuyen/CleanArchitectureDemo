//
//  PlaceListViewController.swift
//  Application
//
//  Created by ThuyenBV on 31/03/2022.
//

import Domain
import RxCocoa
import RxDataSources
import RxSwift
import UIKit

class PlaceListViewController: TableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func buildLayout() {
        super.buildLayout()

        tableView.register(R.nib.placeItemTableViewCell)
    }

    override func bindViewModel() {
        super.bindViewModel()

        let dataSource = RxTableViewSectionedReloadDataSource<PlaceListSection>(configureCell: { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.placeItemTableViewCell, for: indexPath)
            cell?.bindModel(model: item)
            return cell ?? UITableViewCell()
        })

        guard let viewModel = viewModel as? PlaceListViewModel else { return }

        let refresh = Observable.of(Observable.just(()), refreshTrigger).merge()
        let placeSelection = tableView.rx.modelSelected(Place.self).asObservable()
        let input = PlaceListViewModel.Input(refresh: refresh,
                                             placeSelection: placeSelection)

        let output = viewModel.handle(input: input)
        output.items.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
        output.placeSelected.drive { [weak self] viewModel in
            self?.navigator?.show(segue: .placeDetail(viewModel), sender: self, transition: .navigation())
        }.disposed(by: rx.disposeBag)
    }
}
