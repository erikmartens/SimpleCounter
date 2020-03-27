//
//  CounterListObjectsListViewController.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxSwift
import RxCocoa

class CounterCollectionsListViewController: UIViewController {
  
  // MARK: - User Interface Elements
  
  private lazy var sortBarButton = {
    Factory.BarButtonItem.make(fromType: .sort)
  }()
  
  private lazy var addBarButton = {
    Factory.BarButtonItem.make(fromType: .add)
  }()
  
  private lazy var tableView = {
    Factory.TableView.make(fromType: .counterListObjectsList)
  }()
  
  // MARK: - Assets
  
  private let disposeBag = DisposeBag()
  
  // MARK: - Properties
  
  private var viewModel: CounterCollectionsListViewModel?
  
  // MARK: - Initialization
  
  convenience init(dependencies: CounterCollectionsListViewModel.Dependencies) {
    self.init()
    viewModel = CounterCollectionsListViewModel(dependencies: dependencies)
  }
  
  // MARK: - ViewController LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    layoutViewController()
    
    guard let viewModel = viewModel else {
      return
    }
    viewModel.observeEvents()
    bindContent(fromViewModel: viewModel)
    bindUserInput(toViewModel: viewModel)
  }
}

// MARK: - Private Helpers

private extension CounterCollectionsListViewController {
  
  func layoutViewController() {
    
    extendedLayoutIncludesOpaqueBars = true
    navigationItem.title = R.string.localizable.counterListsList()
    
    /// Bar Button Items
    
    navigationItem.leftBarButtonItem = sortBarButton
    navigationItem.rightBarButtonItem = addBarButton
    
    /// Layout TableView
    
    tableView.dataSource = viewModel?.dataSource
    tableView.delegate = viewModel?.dataSource
    tableView.register(CounterCollectionsListCell.self,
                       forCellReuseIdentifier: Constants.Identifier.TableCell.counterListObjectsListCellIdentifier)
    
    let tableViewConstraints = [
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ]
    
    view.addSubview(tableView, constraints: tableViewConstraints)
  }
  
  func bindContent(fromViewModel viewModel: CounterCollectionsListViewModel) {
    viewModel.dataSource.sectionsSource
      .map { _ in () }
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { [weak self] in self?.tableView.reloadDataAnimated() })
      .disposed(by: disposeBag)
  }
  
  func bindUserInput(toViewModel viewModel: CounterCollectionsListViewModel) {
    rx
      .displayed
      .filter { $0 } // filter true
      .take(1)
      .map { _ in }
      .bind(to: viewModel.onViewDidAppearSubject)
      .disposed(by: disposeBag)
    
    sortBarButton
      .rx
      .tap
      .bind(to: viewModel.onSortButtonPressedSubject)
      .disposed(by: disposeBag)
    
    addBarButton
      .rx
      .tap
      .bind(to: viewModel.onAddButtonPressedSubject)
      .disposed(by: disposeBag)
  }
}
