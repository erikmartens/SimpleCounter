//
//  CounterListObjectsListFlow.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxFlow

class CounterCollectionsListFlow: Flow {
  
  // MARK: - Assets
  
  var root: Presentable {
    rootViewController
  }
  
  private let rootViewController: CounterCollectionsListViewController
  
  // MARK: - Initialization
  
  init(dependencies: CounterCollectionsListViewModel.Dependencies) {
    rootViewController = CounterCollectionsListViewController(dependencies: dependencies)
  }
  
  // MARK: - Functions
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? ListStep else {
      return .none
    }
    return .one(flowContributor: .forwardToParentFlow(withStep: step))
  }
}
