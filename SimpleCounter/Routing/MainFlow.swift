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
  
  // MARK: - Properties
   
   private let stepper: MainStepper
  private weak var window: UIWindow?
   
   // MARK: - Initialization
   
   init(stepper: MainStepper) {
     self.stepper = stepper
   }
  
  // MARK: - Functions
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? MainStep else {
      return .none
    }
    switch step {
    case .initial:
      return summonMainTabBar()
    }
  }
}

private extension MainFlow {
  
  func summonMainTabBar() -> FlowContributors {
    window?.rootViewController = rootViewController
    
    return .none // TODO return .multiple
  }
}
