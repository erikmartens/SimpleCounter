//
//  ListStepper.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxFlow
import RxCocoa

enum ListStep: Step {
  // TODO: add emptyCollectionsList
  case none
  case counterCollectionsList
  case counterCollectionDetails(identifier: String)
  case addCounterCollection
}

class ListStepper: Stepper {
  
  // MARK: - Assets
  
  var steps = PublishRelay<Step>()
  
  var initialStep: Step {
    ListStep.counterCollectionsList
  }
  
  // MARK: - Functions
  
  func readyToEmitSteps() {}
}
