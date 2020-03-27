//
//  CounterListObjectsListFlow.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxFlow

class ListFlow: Flow {
  
  // MARK: - Assets
  
  var root: Presentable {
    rootViewController
  }
  
  private lazy var rootViewController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.tabBarItem.image = Constants.Theme.Symbol.list(withWeight: .large)
    navigationController.tabBarItem.title = R.string.localizable.list()
    return navigationController
  }()
  
  // MARK: - Initialization
  
  init() {}
  
  deinit {
    print("\(String(describing: self)) was deinitialized")
  }
  
  // MARK: - Functions
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? ListStep else {
      return .none
    }
    switch step {
    case .none:
      return .none
    case .counterCollectionsList:
      return summonCounterListObjectsList()
    case let .counterCollectionDetails(identifier):
      return summonCounterListDetails(for: identifier)
    case .addCounterCollection:
      return summonAddCounterList()
    }
  }
}

private extension ListFlow {
  
  func summonCounterListObjectsList() -> FlowContributors {
    let counterListObjectsListStepper = CounterCollectionsListStepper()
    let counterListObjectsListFlow = CounterCollectionsListFlow(
      dependencies: CounterCollectionsListViewModel.Dependencies(
        stepper: counterListObjectsListStepper,
        dataSource: CounterCollectionsListTableDelegateDataSource()
      )
    )
    
    Flows.whenReady(
      flow1: counterListObjectsListFlow
    ) {
      [weak self] (counterListObjectsListRoot: CounterCollectionsListViewController) in
      self?.rootViewController.setViewControllers([counterListObjectsListRoot], animated: false)
    }
    
    return .one(flowContributor: .contribute(withNextPresentable: counterListObjectsListFlow, withNextStepper: counterListObjectsListStepper))
  }
  
  func summonCounterListDetails(for identifier: String) -> FlowContributors {
    return .none // TODO return
  }
  
  func summonAddCounterList() -> FlowContributors {
    return .none // TODO return
  }
}
