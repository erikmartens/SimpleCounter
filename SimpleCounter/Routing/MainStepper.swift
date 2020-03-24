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
  case initial
}

class MainStepper: Stepper {
  
  // MARK: - Assets
  
  var steps = PublishRelay<Step>()
  
  var initialStep: Step {
    MainStep.initial
  }
  
  // MARK: - Functions
  
  func readyToEmitSteps() {}
}
