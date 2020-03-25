//
//  CounterListObjectsListFlow.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxFlow

class CounterListObjectsListFlow: Flow {
  
  // MARK: - Assets
  
  var root: Presentable {
    rootViewController
  }
  
  private lazy var rootViewController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.tabBarItem.image = UIImage(systemName: "text.justify")
    navigationController.tabBarItem.title = R.string.localizable.list()
    return navigationController
  }()
  
  // MARK: - Initialization
  
  init(){}
  
  deinit {
    print("\(String(describing: self)) was deinitialized")
  }
  
  // MARK: - Functions
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? CounterListObjectsListStep else {
      return .none
    }
    switch step {
    case .counterListObjectsList:
      return summonCounterListObjectsList()
    case let .counterListDetails(identifier):
      return summonCounterListDetails(for: identifier)
    case .addCounterList:
      return summonAddCounterList()
    }
  }
}

private extension CounterListObjectsListFlow {
  
  func summonCounterListObjectsList() -> FlowContributors {
    rootViewController.setViewControllers([UIViewController()], animated: false)
    return .none // TODO return
  }
  
  func summonCounterListDetails(for identifier: String) -> FlowContributors {
    return .none // TODO return
  }
  
  func summonAddCounterList() -> FlowContributors {
    return .none // TODO return
  }
}
