//
//  TableCell.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

protocol TableCell: DividerView, RoundedView, UITableViewCell {
  var style: TableCellStyle { get }
  func configure(withViewModel viewModel: TableCellViewModel?)
}

extension TableCell {
  func configureCellStyle(with cellStyle: TableCellStyle) {
    switch cellStyle {
    case .none:
      break
    case let .alwaysRounded(cornerRadius):
      roundCorners([.allCorners], withRadius: cornerRadius)
      dividerView?.isHidden = true
    case let .cellPositonBased(cellPosition, cornerRadius):
      roundCorners(cellPosition.roundedCorners, withRadius: cornerRadius)
      dividerView?.isHidden = cellPosition.isDividerHidden
    }
  }
}
