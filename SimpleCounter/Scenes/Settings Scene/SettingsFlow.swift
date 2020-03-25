//
//  SettingsFlow.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxFlow

class SettingsFlow: Flow {
  
  // MARK: - Assets
  
  var root: Presentable {
    rootViewController
  }
  
  private lazy var rootViewController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.tabBarItem.image = UIImage(systemName: "gear")
    navigationController.tabBarItem.title = R.string.localizable.settings()
    return navigationController
  }()
  
  // MARK: - Initialization
  
  init(){}
  
  deinit {
    print("\(String(describing: self)) was deinitialized")
  }
  
  // MARK: - Functions
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? SettingsStep else {
      return .none
    }
    switch step {
    case .settings:
      return summonSettings()
    }
  }
}

private extension SettingsFlow {
  
  func summonSettings() -> FlowContributors {
    rootViewController.setViewControllers([UIViewController()], animated: false)
    return .none // TODO return
  }
}
