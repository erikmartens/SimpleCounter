//
//  MainFlow.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 24.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxFlow

class MainFlow: Flow {
  
  // MARK: - Assets
  
  var root: Presentable {
    rootViewController
  }
  
  private lazy var rootViewController = {
    UITabBarController()
  }()
  
  // MARK: - Initialization
  
  init() {}
  
  deinit {
    print("\(String(describing: self)) was deinitialized")
  }
  
  // MARK: - Functions
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? MainStep else {
      return .none
    }
    switch step {
    case .rootTabBar:
      return summonRootTabBar()
    }
  }
}

private extension MainFlow {
  
  func summonRootTabBar() -> FlowContributors {
    
    let counterListObjectsListFlow = CounterListObjectsListFlow()
    let settingsFlow = SettingsFlow()
    
    Flows.whenReady(
      flow1: counterListObjectsListFlow,
      flow2: settingsFlow
    ) {
      [weak self] (counterListObjectsListRoot: UINavigationController, settingsRoot: UINavigationController) in
      self?.rootViewController.viewControllers = [
        counterListObjectsListRoot,
        settingsRoot
      ]
    }
    
    return .multiple(flowContributors: [
      .contribute(withNextPresentable: counterListObjectsListFlow, withNextStepper: CounterListObjectsListStepper()),
      .contribute(withNextPresentable: settingsFlow, withNextStepper: SettingsStepper())
    ])
  }
}
