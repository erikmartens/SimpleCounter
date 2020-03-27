//
//  TableSection.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

protocol TableSection {
  var sectionTitle: String? { get set }
  var sectionTitleHeight: CGFloat { get set }
  var sectionItems: [TableCellViewModel] { get set }
}

extension TableSection {
  var rowsCount: Int {
    sectionItems.count
  }
}
