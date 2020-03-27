//
//  CellPosition.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

enum TableCellStyle {
  case none
  case alwaysRounded(cornerRadius: CGFloat)
  case cellPositonBased(cellPosition: TableCellPosition, cornerRadius: CGFloat)
}

enum TableCellPosition {
  case top
  case middle
  case bottom
  case single
}

extension TableCellPosition {
  var roundedCorners: UIRectCorner {
    switch self {
    case .top:
      return UIRectCorner([.topRight, .topLeft])
    case .bottom:
      return UIRectCorner([.bottomRight, .bottomLeft])
    case .single:
      return UIRectCorner([.allCorners])
    case .middle:
      return UIRectCorner([])
    }
  }
  
  var isDividerHidden: Bool {
    self == .bottom || self == .single
  }
}
