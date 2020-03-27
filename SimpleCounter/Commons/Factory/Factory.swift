//
//  Factory.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import Foundation

protocol FactoryFunction {
  associatedtype InputType
  associatedtype ResultType
  
  static func make(fromType type: InputType) -> ResultType
}

enum Factory {}
