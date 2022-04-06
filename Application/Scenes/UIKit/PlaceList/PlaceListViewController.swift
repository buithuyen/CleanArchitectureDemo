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

class PlaceListViewController: ViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(R.nib.placeItemTableViewCell)

        return tableView
    }()

    var places: [Place] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.networkProvider.getNearbyPlaces().subscribe(onSuccess: { places in
            self.places = places
            self.tableView.reloadData()
        }, onFailure: { _ in

        }).disposed(by: rx.disposeBag)
    }

    override func buildLayout() {
        super.buildLayout()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets.zero)
        }
    }

    override func bindViewModel() {
        super.bindViewModel()

        let dataSource = RxTableViewSectionedReloadDataSource<PlaceListSection>(configureCell: { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.placeItemTableViewCell, for: indexPath)
            cell?.bindModel(model: item)
            return cell ?? UITableViewCell()
        })

        guard let viewModel = viewModel as? PlaceListViewModel else { return }
        let input = PlaceListViewModel.Input(refresh: Observable.just(()))
        let output = viewModel.handle(input: input)
        output.items.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
    }
}
