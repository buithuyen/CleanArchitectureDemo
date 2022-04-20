//
//  TableViewController.swift
//  Application
//
//  Created by Bùi Văn Thuyên on 07/04/2022.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class TableViewController: ViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets.zero)
        }

        return tableView
    }()

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        return refreshControl
    }()

    let refreshTrigger = PublishSubject<Void>()
    let loadmoreTrigger = PublishSubject<Void>()

    let isRefreshLoading = BehaviorRelay(value: false)
    let isLoadmoreLoading = BehaviorRelay(value: false)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func buildLayout() {
        super.buildLayout()
        
        refreshControl.rx.controlEvent(.valueChanged).bind(to: refreshTrigger).disposed(by: rx.disposeBag)
        isRefreshLoading.bind(to: refreshControl.rx.isRefreshing).disposed(by: rx.disposeBag)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel?.refreshLoading.asObservable().bind(to: isRefreshLoading).disposed(by: rx.disposeBag)
        viewModel?.loadmoreLoading.asObservable().bind(to: isLoadmoreLoading).disposed(by: rx.disposeBag)
    }
}
