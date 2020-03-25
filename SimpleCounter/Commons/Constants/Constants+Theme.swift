//
//  Constants+Theme.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

extension Constants {
  enum Theme {}
}

extension Constants.Theme {
  enum Color {}
}

extension Constants.Theme {
  enum Symbol {
    static func list(withWeight weight: Constants.Theme.Weight) -> UIImage? {
      UIImage(systemName: "text.justify", withConfiguration: weight.symbolConfiguration)
    }
    static func settings(withWeight weight: Constants.Theme.Weight) -> UIImage? {
      UIImage(systemName: "gear", withConfiguration: weight.symbolConfiguration)
    }
  }
}

extension Constants.Theme {
  enum Weight {
    case small
    case medium
    case large
    
    var symbolConfiguration: UIImage.SymbolConfiguration {
      switch self {
      case .small:
        return UIImage.SymbolConfiguration(weight: .regular)
      case .medium:
        return UIImage.SymbolConfiguration(weight: .medium)
      case .large:
        return UIImage.SymbolConfiguration(weight: .semibold)
      }
    }
  }
}
