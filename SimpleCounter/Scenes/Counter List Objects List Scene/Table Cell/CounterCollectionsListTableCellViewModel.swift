//
//  CounterCollectionsListTableCellViewModel.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 27.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import Foundation

class CounterCollectionsListTableCellViewModel: TableCellViewModel {
  let counterCollectionModel: CounterCollection
  init(counterCollectionModel: CounterCollection) {
    self.counterCollectionModel = counterCollectionModel
  }
}
