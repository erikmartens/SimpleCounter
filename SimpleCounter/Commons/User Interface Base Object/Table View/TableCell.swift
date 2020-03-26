//
//  TableCell.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

enum TableCellStyle {
  case none
  case alwaysRounded
  case cellPositonBased
}

protocol TableCell: DividerView, RoundedView, UITableViewCell {
  var style: TableCellStyle { get }
  func configure(withViewModel viewModel: TableCellViewModel?)
}

extension TableCell {
  func configureCellStyle(with cellPosition: TableCellPosition, cornerRadius: CGFloat?) {
    roundCorners(cellPosition.roundedCorners, withRadius: cornerRadius ?? 0)
    dividerView.isHidden = cellPosition.isDividerHidden
  }
}
