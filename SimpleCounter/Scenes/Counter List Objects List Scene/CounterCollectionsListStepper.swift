//
//  CounterListObjectsListStepper.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxFlow
import RxCocoa

class CounterCollectionsListStepper: Stepper {
  
  // MARK: - Assets
  
  var steps = PublishRelay<Step>()
  
  var initialStep: Step {
    ListStep.none
  }
  
  // MARK: - Functions
  
  func readyToEmitSteps() {}
}
