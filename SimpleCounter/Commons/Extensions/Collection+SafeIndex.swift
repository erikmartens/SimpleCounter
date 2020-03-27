//
//  Collection+SafeIndex.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxCocoa

extension Collection {
  subscript (safe index: Index) -> Element? {
      indices.contains(index) ? self[index] : nil
  }
}

extension BehaviorRelay where Element == [TableSection]? {
  subscript (indexPath: IndexPath) -> TableCellViewModel? {
    return value?[safe: indexPath.section]?.sectionItems[safe: indexPath.row]
  }
}
