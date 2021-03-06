//
//  MainStepper.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 24.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxCocoa
import RxFlow

enum MainStep: Step {
  case rootTabBar
}

class MainStepper: Stepper {
  
  // MARK: - Assets
  
  var steps = PublishRelay<Step>()
  
  var initialStep: Step {
    MainStep.rootTabBar
  }
  
  // MARK: - Functions
  
  func readyToEmitSteps() {}
}
