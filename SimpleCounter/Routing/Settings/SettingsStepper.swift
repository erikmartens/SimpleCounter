//
//  SettingsStepper.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxCocoa
import RxFlow

enum SettingsStep: Step {
  case settings
}

class SettingsStepper: Stepper {
  
  // MARK: - Assets
  
  var steps = PublishRelay<Step>()
  
  var initialStep: Step {
    SettingsStep.settings
  }
  
  // MARK: - Functions
  
  func readyToEmitSteps() {}
}
