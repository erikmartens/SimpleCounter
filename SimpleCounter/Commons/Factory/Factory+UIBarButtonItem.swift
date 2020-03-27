//
//  Factory+UIBarButtonItem.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit.UIBarButtonItem

extension Factory {
  
  struct BarButtonItem: FactoryFunction {
    typealias InputType = BarButtonItemType
    typealias ResultType = UIBarButtonItem
    
    enum BarButtonItemType {
      case add
      case sort
    }
    
    static func make(fromType type: InputType) -> ResultType {
      switch type {
      case .add:
        return UIBarButtonItem(image: Constants.Theme.Symbol.add(withWeight: .large),
                               style: .plain,
                               target: nil,
                               action: nil)
      case .sort:
        return UIBarButtonItem(image: Constants.Theme.Symbol.sort(withWeight: .large),
                               style: .plain,
                               target: nil,
                               action: nil)
      }
    }
  }
}
