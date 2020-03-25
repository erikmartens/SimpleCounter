//
//  CounterListObjectsListStepper.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxCocoa
import RxFlow

enum CounterListObjectsListStep: Step {
  case counterListObjectsList
  case counterListDetails(identifier: String)
  case addCounterList
}

class CounterListObjectsListStepper: Stepper {
  
  // MARK: - Assets
  
  var steps = PublishRelay<Step>()
  
  var initialStep: Step {
    CounterListObjectsListStep.counterListObjectsList
  }
  
  // MARK: - Functions
  
  func readyToEmitSteps() {}
}
