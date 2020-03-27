//
//  CounterListObjectsListCell.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

class CounterCollectionsListCell: UITableViewCell, TableCell {
  
  // MARK: - Assets
  
  lazy var style: TableCellStyle = {
    TableCellStyle.alwaysRounded(cornerRadius: Constants.Theme.Weight.medium.cornerRadiusValue)
  }()
  
  var dividerView: UIView? {
    nil
  }
  
  var topInsets: CGFloat {
    4
  }
  
  var bottomInsets: CGFloat {
    4
  }
  
  var leadingInsets: CGFloat {
    8
  }
  
  var trailingInsets: CGFloat {
    8
  }
  
  // MARK: - Functions
  
  func configure(withViewModel viewModel: TableCellViewModel?) {
    // TODO
  }
}
